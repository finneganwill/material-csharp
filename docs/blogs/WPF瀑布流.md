# WPF瀑布流

xaml
```xml
<Window x:Class="MvvmTest.IndexWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:hc="https://handyorg.github.io/handycontrol"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:MvvmTest"
        mc:Ignorable="d"
        Title="IndexWindow"
        Height="450"
        Width="800">
    <Window.DataContext>
        <local:IndexViewModel />
    </Window.DataContext>

    <Grid>
        <ScrollViewer ScrollChanged="WaterfallPanel_ScrollChanged"
                      VerticalScrollBarVisibility="Hidden">
            <hc:WaterfallPanel Name="waterfallPanel"
                               Groups="3">
                <hc:Card Height="200"
                         Background="AliceBlue"
                         Margin="15"
                         DataContext="{Binding}">
                    <hc:Card.Header>
                        <TextBlock  Name="textBlock1"
                                    FontSize="16"
                                    FontWeight="Bold"
                                    Text="{Binding Header}" />
                    </hc:Card.Header>
                </hc:Card>
            </hc:WaterfallPanel>
        </ScrollViewer>
    </Grid>
</Window>
```

```cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace MvvmTest
{
    /// <summary>
    /// IndexWindow.xaml 的交互逻辑
    /// </summary>
    public partial class IndexWindow : Window
    {
        private List<string> items; // 数据源
        private int loadedItemCount = 100; // 已加载的列表项数量
        public IndexWindow()
        {
            InitializeComponent();

            //items = new List<string>();
            //// 初始化数据源
            //for (int i = 0; i < loadedItemCount; i++)
            //{
            //    items.Add("Item " + (i + 1));
            //}

            //UpdateItems();
        }

        public void WaterfallPanel_ScrollChanged(object sender, ScrollChangedEventArgs e)
        {
            ScrollViewer scrollViewer = (ScrollViewer)sender;

            // 判断是否滚动到底部
            if (scrollViewer.VerticalOffset >= scrollViewer.ScrollableHeight)
            {
                loadedItemCount += 3; // 每次加载3个新项
                UpdateItems();
            }
        }

        private void UpdateItems()
        {
            //// 清空容器
            //waterfallPanel.Children.Clear();

            //// 添加已加载的项
            //for (int i = 0; i < loadedItemCount; i++)
            //{
            //    items.Add("Item " + (i + 1));
            //    TextBlock textBlock = new TextBlock()
            //    {
            //        Text = items[i],
            //        Background = new SolidColorBrush(Colors.LightBlue),
            //        Margin = new Thickness(5)
            //    };
            //    waterfallPanel.Children.Add(textBlock);
            //}
        }
    }
}
```

vm
```cs
using CommunityToolkit.Mvvm.Input;
using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using MessageBox = System.Windows.MessageBox;

namespace MvvmTest
{
    public class IndexViewModel : INotifyPropertyChanged
    {

        public string Header { get; set; }

        public IndexViewModel()
        {
            Header = "你好";
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}

```