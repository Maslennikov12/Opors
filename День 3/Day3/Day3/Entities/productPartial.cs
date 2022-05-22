using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;

namespace Day3.Entities
{
    public partial class Product
    {
        public string Active
        {
            get
            {
                if(IsActive)               
                    return "Активен";
                    else 
                        return"Не активен";
                
            }
        }
        public Color ProductColor
        {
            get
            {
                if (IsActive)
                    return Color.FromRgb(255, 255, 255);
                else
                    return Color.FromRgb(128, 128, 128);
            }
        }
    }
}
