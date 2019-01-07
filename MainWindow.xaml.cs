using System;
using System.Collections.Generic;
using System.Windows;
using System.IO;
using System.Data;
using System.Windows.Controls;
using System.Data.Odbc;

namespace WpfAppCSV
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            dateTimePicker.SelectedDate = DateTime.Today;
        }

        string warunekData;
        string warunekJakosc;
        string warunekStatus;

        DateTime _modification;
        public OdbcConnection OdbcConnect;

        public delegate void ReadCSVFile(string s);

        private async void ReadFromCSV(string file)
        {
            int rowsAffected = 0;
            List<Dane> dane = new List<Dane>();
            String line;

            try
            {
                var connectionString = @"DSN=PLC_SQL;DatabaseName=PLC_DB;UID=PLC;PWD=plc_pwd;";
                OdbcConnect = new OdbcConnection(connectionString);
                OdbcConnect.Open();

                FileStream SourceStream = File.Open((file), FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
                StreamReader sr = new StreamReader(SourceStream);

                while ((line = await sr.ReadLineAsync()) != null)
                {
                    string[] s = line.Split(',');

                    var _dane = new Dane
                    {
                        Data = s[18],
                        Godzina = s[0],
                        Kod = (s[2]),
                        JakoscProcentowa = Int32.Parse(s[4]),
                        OgolnaJakosc = s[5],
                        Decode = s[6],
                        CellContrast = s[7],
                        CellModulation = s[8],
                        ReflectanceMargin = s[9],
                        FixedPatternDamage = s[10],
                        FormatInformationDamage = s[11],
                        VersionInformationDamage = s[12],
                        AxialNonuniformity = s[13],
                        GridNonuniformity = s[14],
                        UnusedErrorCorrectiion = s[15],
                        PrintGrowthHorizontal = s[16],
                        PrintGrowthVertical = s[17],
                        NazwaProjektu = s[19]
                    };

                    int jakosc = _dane.JakoscProcentowa;
                    int prog = Int32.Parse(ProgJakosci.Text);

                    if (jakosc > prog)
                    {
                        _dane.Status = "OK";
                    }
                    else
                    {
                        _dane.Status = "NOT OK";
                    }

                    dane.Add(_dane);

                    OdbcCommand insert = new OdbcCommand("INSERT INTO KODYSMT(STATUS,DATA,GODZINA,KOD,JAKOSCPROCENTOWA,OGOLNAJAKOSC,DECODE,CELLCONTRAST," +
                                                        "CELLMODULATION,REFLECTANCEMARGIN,FIXEDPATTERNDAMAGE,FORMATINFORMATIONDAMAGE,VERSIONINFORMATIONDAMAGE" +
                                                        ",AXIALNONUNIFORMITY,GRIDNONUNIFORMITY,UNUSEDERRORCORRECTIION,PRINTGROWTHHORIZONTAL,PRINTGROWTHVERTICAL," +
                                                        "NAZWAPROJEKTU) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);", OdbcConnect);

                    insert.Parameters.Add("@field1", OdbcType.Text);
                    insert.Parameters.Add("@field2", OdbcType.Text);
                    insert.Parameters.Add("@field3", OdbcType.Text);
                    insert.Parameters.Add("@field4", OdbcType.Text);
                    insert.Parameters.Add("@field5", OdbcType.Int);
                    insert.Parameters.Add("@field6", OdbcType.Text);
                    insert.Parameters.Add("@field7", OdbcType.Text);
                    insert.Parameters.Add("@field8", OdbcType.Text);
                    insert.Parameters.Add("@field9", OdbcType.Text);
                    insert.Parameters.Add("@field10", OdbcType.Text);
                    insert.Parameters.Add("@field11", OdbcType.Text);
                    insert.Parameters.Add("@field12", OdbcType.Text);
                    insert.Parameters.Add("@field13", OdbcType.Text);
                    insert.Parameters.Add("@field14", OdbcType.Text);
                    insert.Parameters.Add("@field15", OdbcType.Text);
                    insert.Parameters.Add("@field16", OdbcType.Text);
                    insert.Parameters.Add("@field17", OdbcType.Text);
                    insert.Parameters.Add("@field18", OdbcType.Text);
                    insert.Parameters.Add("@field19", OdbcType.Text);

                    insert.Parameters["@field1"].Value = _dane.Status;             
                    insert.Parameters["@field2"].Value = _dane.Data;                    
                    insert.Parameters["@field3"].Value = _dane.Godzina;                    
                    insert.Parameters["@field4"].Value = _dane.Kod;
                    insert.Parameters["@field5"].Value = _dane.JakoscProcentowa;
                    insert.Parameters["@field6"].Value = _dane.OgolnaJakosc;
                    insert.Parameters["@field7"].Value = _dane.Decode;
                    insert.Parameters["@field8"].Value = _dane.CellContrast;
                    insert.Parameters["@field9"].Value = _dane.CellModulation;
                    insert.Parameters["@field10"].Value = _dane.ReflectanceMargin;
                    insert.Parameters["@field11"].Value = _dane.FixedPatternDamage;
                    insert.Parameters["@field12"].Value = _dane.FormatInformationDamage;
                    insert.Parameters["@field13"].Value = _dane.VersionInformationDamage;
                    insert.Parameters["@field14"].Value = _dane.AxialNonuniformity;
                    insert.Parameters["@field15"].Value = _dane.GridNonuniformity;
                    insert.Parameters["@field16"].Value = _dane.UnusedErrorCorrectiion;
                    insert.Parameters["@field17"].Value = _dane.PrintGrowthHorizontal;
                    insert.Parameters["@field18"].Value = _dane.PrintGrowthVertical;
                    insert.Parameters["@field19"].Value = _dane.NazwaProjektu;
                    insert.ExecuteNonQuery();

                    rowsAffected = insert.ExecuteNonQuery();
                }

                if (rowsAffected > 0)
                {
                    MessageBox.Show("Plik został odczytany i przesłany do bazy", "Success");
                }

                DataGrid.ItemsSource = dane;
                sr.Dispose();
                sr.Close();
                OdbcConnect.Dispose();
                OdbcConnect.Close();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message,"Error");
            }
        }

        public static void nazwaPliku(ReadCSVFile fileName)
        {
            fileName("tmp.csv");
        }

        private void CustomButton_Click(object sender, RoutedEventArgs e)
        {
            DateTime creation = File.GetCreationTime(@"tmp.csv");
            DateTime modification = File.GetLastWriteTime(@"C:tmp.csv");     
            ReadCSVFile read = new ReadCSVFile(ReadFromCSV);

            if (modification > _modification)
            {
                nazwaPliku(read);
            }
            else
            {
                MessageBox.Show("Plik został już odczytany");
            }
            _modification = modification;
        }

        private void Odczyt_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var connectionString = @"DSN=PLC_SQL;DatabaseName=PLC_DB;UID=PLC;PWD=plc_pwd;";
                OdbcConnect = new OdbcConnection(connectionString);
                OdbcConnect.Open();

                string AND = " AND ";
                string warunekSwitch = "";
                string polecenie = "";
                string warunekProjekt = "";

                if (String.IsNullOrEmpty(warunekJakosc) && String.IsNullOrEmpty(warunekStatus))
                {
                    warunekSwitch = "0";
                }

                if (String.IsNullOrEmpty(warunekJakosc) && (String.IsNullOrEmpty(warunekStatus) != true))
                {
                    warunekSwitch = "1";
                }

                if (String.IsNullOrEmpty(warunekStatus) && (String.IsNullOrEmpty(warunekJakosc) != true))
                {
                    warunekSwitch = "2";
                }

                if ((String.IsNullOrEmpty(warunekStatus) != true) && (String.IsNullOrEmpty(warunekJakosc) != true))
                {
                    warunekSwitch = "3";
                }

                if (String.IsNullOrEmpty(NazwaProjektu.Text) != true)
                {
                    warunekProjekt = " AND NAZWAPROJEKTU = '" + NazwaProjektu.Text + "'";
                }

                switch (warunekSwitch)
                {
                    case "0":
                        polecenie = "SELECT * FROM KODYSMT WHERE" + this.warunekData + warunekProjekt;
                        break;
                    case "1":
                        polecenie = "SELECT * FROM KODYSMT WHERE" + this.warunekData + AND + this.warunekStatus + warunekProjekt;
                        break;
                    case "2":
                        polecenie = "SELECT * FROM KODYSMT WHERE" + this.warunekData + AND + this.warunekJakosc + warunekProjekt;
                        break;
                    case "3":
                        polecenie = "SELECT * FROM KODYSMT WHERE" + this.warunekData + AND + this.warunekStatus + AND + this.warunekJakosc + warunekProjekt;
                        break;
                    default:
                        polecenie = "SELECT * FROM KODYSMT WHERE" + this.warunekData;
                        break;
                }

                OdbcCommand select = new OdbcCommand(polecenie, OdbcConnect);

                select.ExecuteNonQuery();
                OdbcDataReader odbcDataReader = select.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(odbcDataReader); 
                DataBaseGrid.ItemsSource = dt.DefaultView;
                odbcDataReader.Dispose();
                odbcDataReader.Close();
                OdbcConnect.Dispose();
                OdbcConnect.Close();
            }
            catch (OdbcException ex)
            {
                MessageBox.Show("Błąd wykonania polecenia SELECT: " + ex.Message);
            }
        }

        private void Jakosc_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (((sender as ComboBox).SelectedItem as ComboBoxItem).Content as string != "---")
            {
                warunekJakosc = " OGOLNAJAKOSC = '" + ((sender as ComboBox).SelectedItem as ComboBoxItem).Content as string + "'";
            }
            else
            {
                warunekJakosc = "";
            }
        }

        private void Status_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (((sender as ComboBox).SelectedItem as ComboBoxItem).Content as string != "---")
            {
                warunekStatus = " STATUS = '" + ((sender as ComboBox).SelectedItem as ComboBoxItem).Content as string + "'";
            }
            else
            {
                warunekStatus = "";
            }
        }

        private void dateTimePicker_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            warunekData = " DATA = '"
            + dateTimePicker.SelectedDate.Value.Date.Day.ToString("00") + "/"
            + dateTimePicker.SelectedDate.Value.Date.Month.ToString("00") + "/"
            + dateTimePicker.SelectedDate.Value.Date.Year +"'";
        }
    }
}