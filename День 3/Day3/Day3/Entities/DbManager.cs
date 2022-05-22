using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day3.Entities
{
   public  class DbManager
    {
        public static MaslennikovEntities DBContext;
        public static MaslennikovEntities GetContext()
        {
            if (DBContext == null)
                DBContext = new MaslennikovEntities();
            return DBContext;
        }
    }
}
