   M S B A M L   `   `   `  ����?  ;Day3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:Day3.Forms
Day3.Forms  5   	       Day3.Forms.AddProduct   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   *localclr-namespace:Day3.Forms     5   	     � Title$   ��5   	   $��365.872��6   $��694.393��6#    � WindowStartupLocation$ CenterScreen=�63    � Icon$ service_logo.ico��6X    � 
ResizeMode$ NoResize=�6p    � 	Resources 5	       �� 
TargetType �� Property �� Value��%�   '��       �� 5
   
   " ��6   .�5      ��  � ��$ Right=�64   5      �� 5       � ��$ Center=�62   6C   �� 5       � ��$ 10q�6'   64   5      5      .��5      � $��0,0,4,0q�6   ���	#FFFFFFE3 � RowDefinitions 5   
   �� 5      $
��Auto �6   6,   �� 5      $��40 �6   6*   .+�5   
   A� 	 A� Columns$	 2��6   $	��200��6"   $��168,34,0,-193q�6/   $��1��6F   $
��Left=�6S   $	��348��6n   .+�5      �� Наименование6&   �� 5      -   5        
 ��Name$
 NameTxb��5      ��6'   �� *Title+�� 5      
Цена6   �� 5      -   5        $
 CostTxb��5      ��6'   �� *Cost+ �� StringFormat$
 0.00���� 5      Производитель6'   �� 5      -   5         ��Name$ CmbManufacturer��5       �� DisplayMemberPath$
 Name��6�    �� SelectedItem 60   �� *Manufacturer+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ Explicit=�6�   �� 5      -   5         ��Name$ AddImage��5      $-��'Добавить изображение��6'   5      �� 5      -   5         ��Name$ ProductImage��5      ��6*   �� *MainImagePath+6M   �� 5       Активен?6"   �� 5!      -   5         ��Name$ 
CheckedAct��5!      $��	0,12,0,10q�6+    d� 	IsChecked 6>   �� *
IsActive+6_   5"      �� 5#   
   -   5        $��Сохранить��5#      $
��Left=�6%   $��256,0,0,-257q�6@   $��1��6V   $��90��6c   $��35��6�   $��Bottom=�6�   ���	#FFFF9C1A���	#FFFFFFE36�   �� 5$   
   -   5        $��Отмена��5$      $��403,0,153,-257q�6"   $��1��6:   $��35��6\   $��Bottom=�6h    J� RenderTransformOrigin$ 0.234,0.667&�6�   ���	#FFFF9C1A���	#FFFFFFE3z�5%      V� 5&      .~�5'      �� �� 5(       �� AngleY$ 0.161Q�6$   �� 5)      T� 5*       T� Y$ 0.155Q�6)   5+      5-      �� 5.   
   -	   5        $ 	DeleteBtn��5.      $��Удалить��6$   $
��Left=�66   $��97,0,0,-257q�6Q   $��1��6f   $��91��6s   $��35��6~   $��Bottom=�6�   ���	#FFFF9C1A���	#FFFFFFE36�   �� 5/   
   $��2��6   50      51      