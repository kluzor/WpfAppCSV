using System.Data.Odbc;
using System.Windows;

namespace WpfAppCSV
{
    class Database
    {
        public OdbcConnection OdbcConnect;

        public void Connection()
        {
            try
            {
                var connectionString = @"DSN=PLC_SQL;DatabaseName=PLC_DB;UID=PLC;PWD=plc_pwd;";
                OdbcConnect = new OdbcConnection(connectionString);
                OdbcConnect.Open();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}