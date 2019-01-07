using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;

namespace WpfAppCSV
{
    class Dane
    {
        public string Status { get; set; }
        public string Data { get; set; }
        public string Godzina { get; set; }
        public string Kod { get; set; }
        public int JakoscProcentowa { get; set; }
        public string OgolnaJakosc { get; set; }
        public string Decode { get; set; }
        public string CellContrast { get; set; }
        public string CellModulation { get; set; }
        public string ReflectanceMargin { get; set; }
        public string FixedPatternDamage { get; set; }
        public string FormatInformationDamage { get; set; }
        public string VersionInformationDamage { get; set; }
        public string AxialNonuniformity { get; set; }
        public string GridNonuniformity { get; set; }
        public string UnusedErrorCorrectiion { get; set; }
        public string PrintGrowthHorizontal { get; set; }
        public string PrintGrowthVertical { get; set; }
        public string NazwaProjektu { get; set; }
    }
}