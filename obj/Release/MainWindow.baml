   M S B A M L   `   `   `  ���� D  @WpfAppCSV, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:CustomButtonTutorialCustomButtonTutorial      WpfAppCSV.MainWindow   )my"clr-namespace:CustomButtonTutorial  W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     $	��800��$
��1200��  � Title$  Testery�� � Cursor$
 Hand��$
��Left=�$	��Top=� � Icon$ Images/bury.png�� � 
ResizeMode$ CanResizeWithGrip=�$��Visible=� � WindowStartupLocation$ Manual=�$	��800��$	��600�� � Topmost .  J� 	AllowDrop . $
��Bold"�$��Calibri)�$��16(�.��� .+��� .@��� $��Plik CSV��$��18(�.��� .+�&   System.Windows.Controls.DataGrid  -   $��DataGrid��$��10,55,10,10q�$��16(�$��Calibri)�$��Center=�$��Center=�   MaxColumnWidth$	 600Q�   AutoGenerateColumns .  ��. $��Visible=�$��Visible=�	   Columns	 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn
   Header$
 Status��1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Status+  $

 Data�� �� *Data+  $
 Godzina�� �� *	Godzina+  $	
 Kod�� �� *Kod+  $
 Jakość procentowa�� �� *JakoscProcentowa+  $#
 Ogólna jakość geometryczna�� �� *OgolnaJakosc+  $
 Dekodowanie �� �� *Decode+  $
 Kontrast�� �� *CellContrast+  $
 Modulacja komórki�� �� *CellModulation+  $
 Margines odbicia�� �� *ReflectanceMargin+  $"
 Uszkodzenie znaków stałych�� �� *FixedPatternDamage+  $(
 "Uszkodzenie formatu informacyjnego�� �� *FormatInformationDamage+  $#
 Uszkodzenie informacji wersji�� �� *VersionInformationDamage+  $
 Niejednorodność osiowa�� �� *AxialNonuniformity+  $
 Niejednorodność siatki�� �� *GridNonuniformity+  $$
 Nieużywana korekcja błędów�� �� *UnusedErrorCorrectiion+  $-
 'Znaki poza zakresem kodu w osi poziomej�� �� *PrintGrowthHorizontal+  $-
 'Znaki poza zakresem kodu w osi pionowej�� �� *PrintGrowthVertical+  $
 Nazwa projektu�� �� *NazwaProjektu+   ColumnHeaderStyle ��  �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  .���  �� Property � �� �� Value$ Center=���  � ��$ Arial)���  � ��$ 16(���  � ��$ 36��   RowStyle �� )  #System.Windows.Controls.DataGridRow"   �� Triggers ��  �� Binding �� *Status+ �� Value
 NOT OK.a���  � �� �	#FFFA4646��  �� *Status+ OK.a���  � �� �	#FF82F03CP�  P� Property �@J�IsMouseOver P� Value . . ���  � �� �#F9F99F'   !CustomButtonTutorial.CustomButton  '   !CustomButtonTutorial.CustomButton   Click$ CustomButton_Click��   Text$ Odczytaj z pliku��$
��Left=�$��
160,10,0,0q�$	��Top=�$	��160��$��38��   ImageSource$ Images/download.png��$
��Bold"�$��17(��� -   $��ProgJakosci��$
��Left=�$��24��$��
105,16,0,0q� �� TextWrapping$
 Wrap=�$��60��$	��Top=�$��40��$��16(�$��Calibri)� �� TextAlignment$ Center=�$
��Bold"��� $
��Left=�$��	10,16,0,0q�$
��Wrap=�$��Próg jakości:��$	��Top=�$��22��$��90��$��17(�$��Calibri)�$
��Bold"��� $��Baza danych��$��18(�.��� .+�  -   $��DataBaseGrid��$��10,55,10,10q�$��16(�$��Calibri)�$��Center=�$��Center=�$	 600Q� . ��. $��Visible=�$��Visible=�$��2�� �� "  .���  � ��$ Center=���  � ��$ Arial)���  � ��$ 16(���  � ��$ 36�� �� "   ��  �� *STATUS+
 NOT OK.a���  � �� �	#FFFA4646��  �� *STATUS+ OK.a���  � �� �	#FF82F03CP�  �@J�IsMouseOver . . ���  � �� �#F9F99F  -     Name$ Odczyt��$ Odczyt_Click��$ Odczyt z bazy danych��$��Right=�$��	0,10,10,0q�$	��Top=�$	��190��$��38��$ Images/database.png��$
��Bold"�$��17(�(	  "System.Windows.Controls.DatePicker	  -   $��dateTimePicker��$
��Left=�$��
810,10,0,0q�$	��Top=�$��38��$	��150�� 	  SelectedDateFormat$ Short=�$��18(��� -   $��Status��$
��Left=�$��	65,10,0,0q�$	��Top=�$��38��$	��146��.@��� .��---�� .��OK�� .��NOT OK�� -   $��Jakosc��$
��Left=�$��
325,10,0,0q�$	��Top=�$��38��$	��128��.@��� .��---�� .��A�� .��B�� .��C�� .��D�� .��E�� .��F�� $
��Left=�$��
220,10,0,0q�$
��Wrap=�$��Ogólna jakość:��$	��Top=�$��17(��� $
��Left=�$��	10,10,0,0q�$
��Wrap=�$��Status:��$	��Top=�$��17(��� $
��Left=�$��
468,10,0,0q�$
��Wrap=�$��Nazwa projektu:��$	��Top=�$��17(��� -   $��NazwaProjektu��$
��Left=�$��38��$��
590,10,0,0q�$
 Wrap=�$�� ��$	��Top=�$	��200��$��18(�