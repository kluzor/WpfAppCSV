   M S B A M L   `   `   `  ����D  @WpfAppCSV, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:CustomButtonTutorialCustomButtonTutorial  5   	       WpfAppCSV.MainWindow   5   	   )my"clr-namespace:CustomButtonTutorial  5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   $	��800��5   	   $
��1200��6     � Title$  Testery��6#    � Cursor$
 Hand��63   $
��Left=�6A   $	��Top=�6\    � Icon$ Images/bury.png��6t    � 
ResizeMode$ CanResizeWithGrip=�6�   $��Visible=�5   	    � WindowStartupLocation$ Manual=�6>   $	��800��6]   $	��600��6l    � Topmost .  J� 	AllowDrop . $
��Bold"�6�   $��Calibri)�6�   .��5      � .+�5   
   �� .@�5	      �� $��Plik CSV��6   $��16(�6(   .��5
      � .+�5      &   System.Windows.Controls.DataGrid  -   5        $��DataGrid��5      $��10,55,10,10q�6/   $��16(�6D   $��Calibri)�6R   $��Center=�5      $��Center=�6;      MaxColumnWidth$	 600Q�6]      AutoGenerateColumns .  ��. $��Visible=�5      $��Visible=�5      	   Columns	 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn
   Header$
 Status��61   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6A   �� *Status+  5      $

 Data��61    6?   �� *Data+  5      $
 Godzina��61    6B   �� *	Godzina+  5      $	
 Kod��61    6>   �� *Kod+  5      $
 Jakość procentowa��61    6L   �� *JakoscProcentowa+  5      $#
 Ogólna jakość geometryczna��61    6U   �� *OgolnaJakosc+  5      $
 Dekodowanie ��61    6G   �� *Decode+  5      $
 Kontrast��61    6C   �� *CellContrast+  5      $
 Modulacja komórki��61    6L   �� *CellModulation+  5      $
 Margines odbicia��61    6K   �� *ReflectanceMargin+  5      $"
 Uszkodzenie znaków stałych��61    6U   �� *FixedPatternDamage+  5      $(
 "Uszkodzenie formatu informacyjnego��61    6]   �� *FormatInformationDamage+  5      $#
 Uszkodzenie informacji wersji��61    6X   �� *VersionInformationDamage+  5      $
 Niejednorodność osiowa��61    6Q   �� *AxialNonuniformity+  5      $
 Niejednorodność siatki��61    6Q   �� *GridNonuniformity+  5       $$
 Nieużywana korekcja błędów��61    6U   �� *UnusedErrorCorrectiion+  5!      $-
 'Znaki poza zakresem kodu w osi poziomej��61    6b   �� *PrintGrowthHorizontal+  5"      $-
 'Znaki poza zakresem kodu w osi pionowej��61    6b   �� *PrintGrowthVertical+  5#      $
 Nazwa projektu��61    6I   �� *NazwaProjektu+   ColumnHeaderStyle 5%      �� 5&       �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  6$   .�5'   "   ��  �� Property � �� �� Value$ Center=�6O   �� 5(   "    � ��$ Arial)�6?   �� 5)   "    � ��$ 16(�6=   �� 5*   "    � ��$ 36��6;   5+         RowStyle 5-      �� 5.      )  #System.Windows.Controls.DataGridRow"  6$    �� Triggers 5/   "   �� 50   &    �� Binding 62   �� *Status+ �� Value
 NOT OK6M   .a�51   *   ��  � �� �	#FFFA46466[   52   '   �� 53   &    62   �� *Status+ OK6M   .a�54   *   ��  � �� �	#FF82F03C6[   55   '   P� 56   &    P� Property �@J�IsMouseOver P� Value . . �57   *   ��  � �� �#F9F99F6G   58   '   5:      5<      '   !CustomButtonTutorial.CustomButton  5=      '   !CustomButtonTutorial.CustomButton   Click$ CustomButton_Click��5>   H      Text$ Odczytaj z pliku��5=   &   $
��Left=�6>   $��
160,10,0,0q�6Y   $	��Top=�6m   $	��160��6�   $��38��6�      ImageSource$ Images/download.png��5>   &   $
��Bold"�6c   �� 5?      -   5        $��ProgJakosci��5?      $
��Left=�61   $��22��6L   $��
105,16,0,0q�6X    �� TextWrapping$
 Wrap=�6l   $��60��6�   $	��Top=�6�   $��40��6�   $��14(�5@   !   $��Calibri)�6/    �� TextAlignment$ Center=�6D   $
��Bold"�6[   �� 5A      $
��Left=�6    $��	10,10,0,0q�6;   $
��Wrap=�6N   $��Próg jakości:��6b   $	��Top=�6w   $��22��6�   $��90��6�   $��16(�6�   $��Calibri)�5B   !   $
��Bold"�66   5C      5D      �� 5E      $��Baza danych��6   $��16(�6+   .��5F      �  � ColumnDefinitions 5G      �� 5H      $	��35* �6+   �� 5I      $
��556* �6+   .+�5K        -   5        $��DataBaseGrid��5K      $��10,55,10,10q�63   $��16(�6H   $��Calibri)�6V   $��Center=�5L      $��Center=�6;   $	 600Q�6]    .  ��. $��Visible=�5N      $��Visible=�5O      $��2��6L   	 5P        5Q      $
 Status��61    6A   �� *Status+  5R      $

 Data��61    6?   �� *Data+  5S      $
 Godzina��61    6B   �� *	Godzina+  5T      $	
 Kod��61    6>   �� *Kod+  5U      $
 Jakość procentowa��61    6L   �� *JakoscProcentowa+  5V      $#
 Ogólna jakość geometryczna��61    6U   �� *OgolnaJakosc+  5W      $
 Dekodowanie ��61    6G   �� *Decode+  5X      $
 Kontrast��61    6C   �� *CellContrast+  5Y      $
 Modulacja komórki��61    6L   �� *CellModulation+  5Z      $
 Margines odbicia��61    6K   �� *ReflectanceMargin+  5[      $"
 Uszkodzenie znaków stałych��61    6U   �� *FixedPatternDamage+  5\      $(
 "Uszkodzenie formatu informacyjnego��61    6]   �� *FormatInformationDamage+  5]      $#
 Uszkodzenie informacji wersji��61    6X   �� *VersionInformationDamage+  5^      $
 Niejednorodność osiowa��61    6Q   �� *AxialNonuniformity+  5_      $
 Niejednorodność siatki��61    6Q   �� *GridNonuniformity+  5`      $$
 Nieużywana korekcja błędów��61    6U   �� *UnusedErrorCorrectiion+  5a      $-
 'Znaki poza zakresem kodu w osi poziomej��61    6b   �� *PrintGrowthHorizontal+  5b      $-
 'Znaki poza zakresem kodu w osi pionowej��61    6b   �� *PrintGrowthVertical+  5c      $
 Nazwa projektu��61    6I   �� *NazwaProjektu+ 5e      �� 5f      "  6$   .�5g   "   ��  � ��$ Center=�6O   �� 5h   "    � ��$ Arial)�6?   �� 5i   "    � ��$ 16(�6=   �� 5j   "    � ��$ 36��6;   5k       5m      �� 5n      "  6$    5o   "   �� 5p   &    62   �� *Status+
 NOT OK6M   .a�5q   *   ��  � �� �	#FFFA46466[   5r   '   �� 5s   &    62   �� *Status+ OK6M   .a�5t   *   ��  � �� �	#FF82F03C6[   5u   '   P� 5v   &    �@J�IsMouseOver . . �5w   *   ��  � �� �#F9F99F6G   5x   '   5z      5|        5}      -   5          Name$ Odczyt��5}   &   $ Odczyt_Click��5~   Z   $ Odczyt z bazy danych��5}   6   $
��Left=�6R   $��	10,10,0,0q�6m   $	��Top=�6�   $	��201��6�   $��38��6�   $ Images/database.png��5~   &   $
��Bold"�6H   $��2��6o   5      5�      5�      5�      5�      