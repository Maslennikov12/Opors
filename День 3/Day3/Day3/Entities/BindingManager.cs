using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Data;

namespace Day3.Entities
{
     public class BindingManager
    {
        public static void GetBindingExpression(FrameworkElement fe, DependencyProperty dp)
        {
            BindingExpression binding = fe.GetBindingExpression(dp);
            binding.UpdateSource();
        }                                                                                                                                                                                                      
    }
}
