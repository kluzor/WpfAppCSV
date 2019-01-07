using System.Windows;

namespace WpfAppCSV
{
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if(PoleHasla.Password == "testery")
            {
                new MainWindow().Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Hasło niepoprawne","Error");
            }
        }
    }
}
