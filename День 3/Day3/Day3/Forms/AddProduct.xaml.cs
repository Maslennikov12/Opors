using Day3.Entities;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Day3.Forms
{
    /// <summary>
    /// Логика взаимодействия для AddProduct.xaml
    /// </summary>
    public partial class AddProduct : Window
    {
        Product currentProduct;
        MaslennikovEntities context = DbManager.GetContext();
        bool isNewProduct;
        byte[] imageInBytes;
        string imagepath;
        public AddProduct()
        {
            InitializeComponent();
            currentProduct = new Product();
            DataContext = currentProduct;
            isNewProduct = true;
            Title = "Добавить продукт";
            DeleteBtn.Visibility = Visibility.Hidden;
            FillComboBox();
        }
        public AddProduct(Product selectedProduct)
        {
            currentProduct = selectedProduct;
            DataContext = currentProduct;
            InitializeComponent();
            isNewProduct = false;
            Title = "Редактировать продукт";
            DeleteBtn.Visibility = Visibility.Visible;
            FillComboBox();
        }
        private void UpdateData()
        {
            //обновление данных
            BindingManager.GetBindingExpression(NameTxb, TextBox.TextProperty);
            BindingManager.GetBindingExpression(CmbManufacturer, ComboBox.SelectedItemProperty);
            BindingManager.GetBindingExpression(CostTxb, TextBox.TextProperty);
            BindingManager.GetBindingExpression(CheckedAct, CheckBox.IsCheckedProperty);
            // BindingManager.GetBindingExpression(ImageBx, TextBox.TextProperty);
        }

        private void FillComboBox()
        {
            List<Manufacturer> productTypes = DbManager.GetContext().Manufacturer.ToList();
            CmbManufacturer.ItemsSource = productTypes;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(NameTxb.Text)
                 && !string.IsNullOrWhiteSpace(CostTxb.Text)
                 && CmbManufacturer.SelectedIndex != -1);
            else
            {
                MessageBox.Show("Не все поля заполнены", "Ошибка");

            }
            // SaveImage();//метод сохранения изоображения
            if (imagepath != null)
                    currentProduct.MainImagePath = imagepath;
            context.SaveChanges();
            if (isNewProduct)
                {
                    context.Product.Add(currentProduct);
                    UpdateData();
                    context.SaveChanges();
                    MessageBox.Show("Данные добавлены", "Удачно");
                    Close();
                }
                else
                {
                    MessageBox.Show("Данные изменены", "Успешно");
                    Close();
                }
            }

        private void DeleteBtn_Click(object sender, RoutedEventArgs e)
        {
            //try

            List<ProductPhoto> products = DbManager.GetContext().ProductPhoto.ToList().
                Where(p => p.ProductID == currentProduct.ID).ToList();
            foreach(ProductPhoto product in products)
            {
                DbManager.GetContext().ProductPhoto.Remove(product);
               
            }
            DbManager.GetContext().SaveChanges();
            List<ProductSale> sale = DbManager.GetContext().ProductSale.ToList().
                Where(p => p.ProductID == currentProduct.ID).ToList();
            foreach(ProductSale sales in sale)
            {
                DbManager.GetContext().ProductSale.Remove(sales);
            }
            DbManager.GetContext().SaveChanges();
            DbManager.GetContext().Product.Remove(currentProduct);
            DbManager.GetContext().SaveChanges();

                MessageBox.Show("Данные успешно удалены", "Информация",
                    MessageBoxButton.OK, MessageBoxImage.Information);
                Close();
           // }
           // catch
          //  {

               // MessageBox.Show("Удаление данного объекта невозможно", "Информация",
                   // MessageBoxButton.OK, MessageBoxImage.Information);

          //  }
        }

        private void AddImage_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Title = "Добавить изображение";
            openFileDialog.CheckFileExists = true;
            openFileDialog.CheckPathExists = true;
            if(openFileDialog.ShowDialog() == true)
            {
                imagepath = openFileDialog.FileName;
                BitmapImage bitmapImage = new BitmapImage();
                bitmapImage.BeginInit();
                bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
                bitmapImage.UriSource = new Uri(imagepath);
                bitmapImage.EndInit();
                ProductImage.Source = bitmapImage;
            }    
        }
    }
        //private void SaveImage()
        //{
        //    //сохранения изоображений
        //    if (filePath == null && currentProduct.MainImagePath== null)
        //    {
        //        var appDir = System.IO.Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
        //        var relativePath = @"picture.png";
        //        filePath = System.IO.Path.Combine(appDir, relativePath);
        //        imageInBytes = File.ReadAllBytes(filePath);
        //        currentProduct.MainImagePath = imageInBytes;
        //    }
        //    else if (filePath != null)
        //    {
        //        imageInBytes = File.ReadAllBytes(filePath);
        //        currentProduct.MainImagePath = imageInBytes;
        //    }
        //}

    }
    

