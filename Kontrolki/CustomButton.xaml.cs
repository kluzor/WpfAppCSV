using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace CustomButtonTutorial
{
    /// <summary>
    /// Interaction logic for CustomButton.xaml
    /// </summary>
    public partial class CustomButton : UserControl
    {
        public CustomButton()
        {
            InitializeComponent();
        }

        public static readonly DependencyProperty TextProperty =
            DependencyProperty.Register("Text", typeof(String),
            typeof(CustomButton), new FrameworkPropertyMetadata(string.Empty));

        public String Text
        {
            get { return GetValue(TextProperty).ToString(); }
            set { SetValue(TextProperty, value); }
        }

        public static readonly DependencyProperty ImageSourceProperty =
            DependencyProperty.Register("ImageSource", typeof(ImageSource),
            typeof(CustomButton), new FrameworkPropertyMetadata(null));

        public ImageSource ImageSource
        {
            get { return GetValue(ImageSourceProperty) as ImageSource; }
            set { SetValue(ImageSourceProperty, value); }
        }

        public static readonly RoutedEvent ClickEvent =
            EventManager.RegisterRoutedEvent("Click", RoutingStrategy.Bubble,
            typeof(RoutedEventHandler), typeof(CustomButton));

        public event RoutedEventHandler Click
        {
            add { AddHandler(ClickEvent, value); }
            remove { RemoveHandler(ClickEvent, value); }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            RaiseEvent(new RoutedEventArgs(ClickEvent));
        }
    }
}