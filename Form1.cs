using System;
using System.Windows.Forms;

namespace TP_MOD3_103022430006
{
    public partial class Form1 : Form
    {
        private long totalSatu = 0;
        private string inputTeks = "";

        public Form1()
        {
            InitializeComponent();
        }

        private void btnAngka_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            inputTeks += btn.Text;

            lblOutput.Text = inputTeks;
        }

        private void btnTambah_Click(object sender, EventArgs e)
        {
            if (long.TryParse(inputTeks, out long angka))
            {
                totalSatu = angka;
            }

            inputTeks = "";
            lblOutput.Text = "0";
        }

        private void btnHasil_Click(object sender, EventArgs e)
        {
            if (long.TryParse(inputTeks, out long angkaKedua))
            {
                long hasil = totalSatu + angkaKedua;
                lblOutput.Text = hasil.ToString();
                totalSatu = 0;
                inputTeks = "";
            }
        }
    }
}