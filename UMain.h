//---------------------------------------------------------------------------

#ifndef UMainH
#define UMainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Imaging.pngimage.hpp>
#include <Vcl.Samples.Spin.hpp>
#include <Data.DB.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.Buttons.hpp>
//---------------------------------------------------------------------------
class TFMain : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TPanel *Panel2;
	TPanel *Panel3;
	TPageControl *PageControl1;
	TTabSheet *Client;
	TTabSheet *Requests;
	TPanel *Panel4;
	TLabel *Label1;
	TImage *Image1;
	TLabel *Label2;
	TEdit *Edit1;
	TLabel *Label3;
	TEdit *Edit2;
	TLabel *Label4;
	TSpinEdit *SpinEdit1;
	TLabel *Label5;
	TEdit *Edit3;
	TLabel *Label6;
	TComboBox *ComboBox1;
	TLabel *Label7;
	TComboBox *ComboBox2;
	TComboBox *ComboBox3;
	TLabel *Label8;
	TListBox *ListBox1;
	TLabel *Label9;
	TSpeedButton *SpeedButton1;
	TSpeedButton *SpeedButton2;
	TLabel *Label10;
	TPanel *Panel5;
	TPanel *Panel6;
	TDBGrid *DBGrid1;
	TLabel *Label11;
	TLabel *Label12;
	TLabel *Label13;
	TLabel *Label14;
	TPanel *Panel7;
	TRadioButton *RadioButton1;
	TRadioButton *RadioButton2;
	TRadioButton *RadioButton3;
	TSpeedButton *SpeedButton3;
	TLabel *Label15;
	TEdit *Edit4;
	TLabel *Label16;
	TTabSheet *Admin;
	TPageControl *PageControl2;
	TTabSheet *ModeleTelefon;
	TTabSheet *Operatori;
	TTabSheet *ProblemeDevice;
	TPanel *Panel9;
	TDBGrid *DBGrid2;
	TPanel *Panel8;
	TDBGrid *DBGrid3;
	TLabel *Label17;
	TLabel *Label18;
	TLabel *Label19;
	TLabel *Label20;
	TPanel *Panel10;
	TPanel *Panel11;
	TLabel *Label21;
	TLabel *Label22;
	TDBGrid *DBGrid5;
	TPanel *Panel12;
	TDBGrid *DBGrid4;
	TTabSheet *Rapoarte;
	TPanel *Panel13;
	TSpeedButton *SpeedButton4;
	TSpeedButton *SpeedButton5;
	TShape *Shape1;
	TShape *Shape2;
	TLabel *Label25;
	TTimer *Timer1;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall ComboBox2Change(TObject *Sender);
	void __fastcall Timer1Timer(TObject *Sender);
	void __fastcall SpeedButton2Click(TObject *Sender);
	void __fastcall SpeedButton1Click(TObject *Sender);
	void __fastcall ResetIds();
	void __fastcall RequestsShow(TObject *Sender);
	void __fastcall DBGrid1CellClick(TColumn *Column);
	void __fastcall SpeedButton3Click(TObject *Sender);
	void __fastcall ModeleTelefonShow(TObject *Sender);
	void __fastcall SpeedButton4Click(TObject *Sender);
	void __fastcall SpeedButton5Click(TObject *Sender);
	void __fastcall Image1Click(TObject *Sender);

private:	// User declarations
public:		// User declarations
	__fastcall TFMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFMain *FMain;
//---------------------------------------------------------------------------
#endif
