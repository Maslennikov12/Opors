using Day3.Entities;
using Day3.Forms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;


namespace Day3
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        MaslennikovEntities _db = DbManager.GetContext();
        int numPages;
        int numEntriesPerPage = 8;
        int numCurrentPage = 1;
        public MainWindow()
        {
            InitializeComponent();      
            FillComboBox();
            CmbManufacturer.SelectedIndex = 0;
            Sort.SelectedIndex = 0;
            RefreshData();
        }
        
        private void FillComboBox()
        {
            List<Manufacturer> man = _db.Manufacturer.ToList();
            Manufacturer facturer = new Manufacturer { Name = "Все производители" };
            facturer.Name = "Все производители";
            man.Insert(0, facturer);
            CmbManufacturer.SelectedIndex = 0;
            CmbManufacturer.ItemsSource = man;
            
        }
        private void RefreshData()
        {
            List<Product> products = _db.Product.ToList();
            products = Filter(products);
            products = Titls(products);
            products = SortProductList(products);
            LViewProducts.ItemsSource = products;
            numPages = (int)Math.Ceiling((products.Count * 1.0) / numEntriesPerPage);

            if (numCurrentPage > numPages)
                numCurrentPage = numPages;

            products = products.Skip((numCurrentPage - 1) * numEntriesPerPage).
                Take(numEntriesPerPage).ToList();

            LViewProducts.ItemsSource = products;//вывод агентов
            CurrentPageBox.Text = numCurrentPage + " / " + numPages;
        }


        private void Button_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ListView_Loaded(object sender, RoutedEventArgs e)
        {

           

        }

        private void TxtNameSearch_TextChadged(object sender, TextChangedEventArgs e)
        {
            RefreshData();
        }
        //поиск
        private List<Product> Titls(List<Product> products) // Метод для поиска названию продукта
        {
            if (!string.IsNullOrWhiteSpace(TxtNameSearch.Text)) // Проверка на ввод данных для поиска
                products = products.Where(p => p.Title.ToLower(). // Проверка соответсвия без учета регистра
                    Contains(TxtNameSearch.Text.ToLower())).ToList();
            return products;
        }
        //фильтрация
        private List<Product> Filter(List<Product> products)
        {
            
            if (CmbManufacturer.SelectedIndex > 0)
                products = products.Where(x => x.Manufacturer == 
                CmbManufacturer.SelectedItem as Manufacturer).ToList();          
                return products;

        }
        private void CmbManufacturer_SelectioChanged(object sender, SelectionChangedEventArgs e)
        {
            RefreshData();
        }

        //сортировка
        private List<Product> SortProductList(List<Product> products)
        {
            if (Sort.SelectedIndex == 1)
                products = products.OrderBy(x => x.Cost).ToList();
            else if (Sort.SelectedIndex == 2)
                products = products.OrderByDescending(x => x.Cost).ToList();
            return products;
        }

        private void CmbCost_TextChanged(object sender, SelectionChangedEventArgs e)
        {
            RefreshData();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            new AddProduct().ShowDialog();           
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            new AddProduct((sender as Button).DataContext as Product).ShowDialog();
            RefreshData();

        }

        private void FirstPageBtn_Click(object sender, RoutedEventArgs e)
        {
            numCurrentPage = 1;
            RefreshData();
        }

        private void PreviousPageBtn_Click(object sender, RoutedEventArgs e)
        {
            if (numCurrentPage != 1)
            {
                numCurrentPage--;
                RefreshData();
            }
        }

        private void NextPageBtn_Click(object sender, RoutedEventArgs e)
        {
            if (numCurrentPage != numPages)
            {
                numCurrentPage++;
                RefreshData();
            }
        }

        private void LastPageBtn_Click(object sender, RoutedEventArgs e)
        {
            numCurrentPage = numPages;
            RefreshData();
        }
    }
}
