   M S B A M L   `   `   `  ����?  ;Day3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:Day3Day3  5   	       Day3.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   $localclr-namespace:Day3     5   	     � Title$   ��5   	   $��461.333��6   $��1315.2��6#    � Icon$ service_logo.ico��62   ���	#FFFFFFE3.��5	      � $��
210,0,0,-3q�6    � ColumnDefinitions 5
   
   �� 5      $
��179* �6   �� 5      $
��926* �6    � RowDefinitions 5   
   �� 5      $
��Auto �6   6,   �� 5      $��* �6   6)   .+�5   
   ��  �� Orientation$ 
Horizontal=�6   $��0,0,0,5q�6.   $��2��6?   .+�5      �� $��	10,0,10,0q�6   .��6'   Производитель66   �� 5      -   5         ��Name$ CmbManufacturer��5      $	��200��6c    �� DisplayMemberPath$
 Name��6�    �� SelectedItem 6o   �� *Manufacturer+6�   �� 5      $��	30,0,10,0q�6   .��6'   Наименование65   �� 5      -   5         ��Name$ TxtNameSearch��5      $	��200��6U   6c   �� 5      $��	10,0,10,0q�6   .��6'   )'Сортировка стоимости6=   �� 5      -   5        $
 Sort��5      $	��200��6L   .@�5      �� $!��Нет сортировки��6   �� 5      $!��По возрастанию��6   �� 5      $��По убыванию��6   5      5      �� 5   
   -   5        $��LViewProducts��5      $��1��6(   $��Disabled=�65   ���	#FF000003
�������$��0,0,0,45q�6�   ���	#FFFFFFE3$��2��6�   ��5      �� 5       .R�5!      � $	��250��6   $	��250��6'   ��5"      �� 5#      	 �� Color	 6.   �� *ProductColor+6O    5%      �� 5&      $��* �6,   69   �� 5'      $��* �6,   69   .+�5)      �� $��0��6    $��Uniform=�6N   ��6-   �� *MainImagePath+6N   � 5*      $��1��6   
�������
 J� Opacity$	
 0.5Q�6?   �� 5+      $��1��6$   $
��Wrap=�61    �� TextAlignment$ Center=�6\   $��18(�6s   $��0,3,0,0q�6�   ��6E   �� *Title+6�   �� 5,      $��1��6$   $
��Wrap=�61   $ Center=�6w   $��16(�6�   $��	0,30,0,10q�6�   $��Bottom=�6�   ��6E   �� *Cost+ �� StringFormat$ {0:N0} руб.��6�   �� 5-      -   5        $��Изменить��5-   !   $��1��64   $
��Left=�6A   $��	50,50,0,0q�6\   $	��Top=�6o   $	��144��6�   ���	#FFFF9C1A���	#FFFFFFE36�   �� 5.      $��1��6$   $
��Wrap=�61   $��	95,75,0,0q�6]   ��6E   �� *Active+6r   5/      50      ��52      �� 53      .R�54      � 6"   55      57      �� 58   
   ���	#FFFFFFE3$
��Left=�6%   $��
-196,0,0,8q�6@   $��1��6T   ���	#FFFF9C1A$	��167��6t   �� 59   
   -   5        $��ёДобавить��59      $
��Left=�6%   $��-186,17,0,0q�6@   $��1��6U   $	��Top=�6b   $	��144��6z   ���	#FFFF9C1A���	#FFFFFFE36�   �� 5:   
   -   5        $��
Выход��5:      $
��Left=�6!   $��-186,0,0,22q�6<   $��1��6Q   $	��144��6^   ���	#FFFF9C1A���	#FFFFFFE3$��20��6�   $��Bottom=�6�   �� 5;   
   -   5         ��Name$ PreviousPageBtn��5;      $��<��6*   $��Right=�69   $��
0,0,353,17q�6U   $��1��6i   $��Bottom=�6v   ���	#FFFF9C1A$��38��6�   $��20��6�   ���	#FFFF9C1A$��1��6�   �� 5<   
   -	   5        $ FirstPageBtn��5<      $��<<��6'   $��Right=�6:   $��
0,0,391,17q�6V   $��1��6j   $��Bottom=�6w   ���	#FFFF9C1A$��38��6�   ���	#FFFF9C1A$��1��6�   �� 5=   
   -
   5         ��Name$ CurrentPageBox��5=      $��
0,0,289,19q�6,   $��1��6@   $
��Wrap=�6M   $�� ��6a   $��16��6i   $��Bottom=�6u   $��Right=�6�   $��53��6�   $��1��6�   �� 5>   
   -   5        $ NextPageBtn��5>      $��>��6&   $��Right=�62   $��
0,0,252,17q�6N   $��1��6b   $��Bottom=�6o   $��38��6�   ���	#FFFF9C1A���	#FFFF9C1A$��1��6�   �� 5?   
   -   5        $ LastPageBtn��5?      $��>>��6&   $��Right=�63   $��
0,0,214,17q�6O   $��1��6c   $��Bottom=�6p   $��38��6�   ���	#FFFF9C1A���	#FFFF9C1A$��1��6�   �� 5@   
   $��1��6   $��1��6%   5A      5B      