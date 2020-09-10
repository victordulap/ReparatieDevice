//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UMain.h"
#include "ULogare.h"
#include "Udm.h"
#include "UInfoMenu.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFMain *FMain;
int DeviceIds[100];
int SectorIds[100];
int ProblemaIds[100];
//---------------------------------------------------------------------------
__fastcall TFMain::TFMain(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFMain::ResetIds()
{
	for(int i = 0; i < 100; i++)
	{
		DeviceIds[i] = 0;
		SectorIds[i] = 0;
		ProblemaIds[i] = 0;
	}

     // sectoare
	dm->QLiber->Close();
	dm->QLiber->SQL->Clear();
	dm->QLiber->SQL->Add("select * from sector");
	dm->QLiber->Open();
	int i = 0;
	while(!dm->QLiber->Eof)
	{
		ComboBox1->Items->Add(dm->QLiber->FieldByName("nume")->AsString);
		SectorIds[i] = dm->QLiber->FieldByName("sector_id")->AsInteger;
		dm->QLiber->Next();
		i++;
	}

	// firme telefon
	dm->QLiber->Close();
	dm->QLiber->SQL->Clear();
	dm->QLiber->SQL->Add("select * from firma");
	dm->QLiber->Open();
	while(!dm->QLiber->Eof)
	{
		ComboBox2->Items->Add(dm->QLiber->FieldByName("nume")->AsString);
		dm->QLiber->Next();
	}

	// probleme
	dm->QLiber->Close();
	dm->QLiber->SQL->Clear();
	dm->QLiber->SQL->Add("select * from PROBLEMA");
	dm->QLiber->Open();
	i = 0;
	while(!dm->QLiber->Eof)
	{
		ListBox1->Items->Add(dm->QLiber->FieldByName("problema")->AsString);
		ProblemaIds[i] = dm->QLiber->FieldByName("problema_id")->AsInteger;
		dm->QLiber->Next();
		i++;
	}
}
//---------------------------------------------------------------------------

void __fastcall TFMain::FormShow(TObject *Sender)
{
	FLogare->ShowModal();
	ResetIds();
}
//---------------------------------------------------------------------------




void __fastcall TFMain::ComboBox2Change(TObject *Sender)
{
    if(ComboBox2->ItemIndex != -1)
	{
		ComboBox3->Clear();

		// modele telefon
		dm->QLiber->Close();
		dm->QLiber->SQL->Clear();
		dm->QLiber->SQL->Add("select * from MODEL where firma_id = :firma_id");
			dm->QLiber2->Close();
			dm->QLiber2->SQL->Clear();
			dm->QLiber2->SQL->Add("select top 1 firma_id from firma where nume = :nume");
			dm->QLiber2->ParamByName("nume")->AsString = ComboBox2->Text;
			dm->QLiber2->Open();
		//Label9->Caption = dm->QLiber2->FieldByName("firma_id")->AsInteger;
		//Label10->Caption = ComboBox2->Text;
		dm->QLiber->ParamByName("firma_id")->AsInteger = dm->QLiber2->FieldByName("firma_id")->AsInteger;
		dm->QLiber->Open();
		int i = 0;
		while(!dm->QLiber->Eof)
		{
			ComboBox3->Items->Add(dm->QLiber->FieldByName("nume")->AsString);
			DeviceIds[i] = dm->QLiber->FieldByName("model_id")->AsInteger;
			dm->QLiber->Next();
			i++;
		}
	}
}
//---------------------------------------------------------------------------

void __fastcall TFMain::Timer1Timer(TObject *Sender)
{
	Label10->Caption = Now();

	//Label11->Caption = "SectorIds = " + IntToStr(SectorIds[ComboBox1->ItemIndex]);
	//Label12->Caption = "DeviceIds = " + IntToStr(DeviceIds[ComboBox3->ItemIndex]);
	//Label13->Caption = "ProblemaIds = " + IntToStr(ProblemaIds[ListBox1->ItemIndex]);
	//Label14->Caption = IntToStr(ListBox1->ItemIndex);
}
//---------------------------------------------------------------------------

void __fastcall TFMain::SpeedButton2Click(TObject *Sender)
{
    ResetIds();

	Edit1->Clear();
	Edit2->Clear();
	Edit3->Clear();

	ComboBox1->ItemIndex = -1;
	ComboBox2->ItemIndex = -1;
	ComboBox3->ItemIndex = -1;
	ComboBox3->Clear();

	SpinEdit1->Value = 18;

	ListBox1->Clear();
	dm->QLiber->Close();
	dm->QLiber->SQL->Clear();
	dm->QLiber->SQL->Add("select * from PROBLEMA");
	dm->QLiber->Open();
	while(!dm->QLiber->Eof)
	{
		ListBox1->Items->Add(dm->QLiber->FieldByName("problema")->AsString);
		dm->QLiber->Next();
	}
}
//---------------------------------------------------------------------------

void __fastcall TFMain::SpeedButton1Click(TObject *Sender)
{
	if(Edit1->Text == "" || Edit2->Text == "" || Edit3->Text == ""
		|| ComboBox1->ItemIndex == -1 || ComboBox2->ItemIndex == -1
		|| ComboBox3->ItemIndex == -1 || ListBox1->ItemIndex == -1)
	{
		ShowMessage("Indeplineste Datele!");
	}
	else
	{
		dm->QLiber->Close();
		dm->QLiber->SQL->Clear();
		dm->QLiber->SQL->Add("insert into CLIENT(SECTOR_ID, MODEL_ID, PROBLEMA_ID, NUME, PRENUME, VARSTA, NR_TELEFON) values(:SECTOR_ID, :MODEL_ID, :PROBLEMA_ID, :NUME, :PRENUME, :VARSTA, :NR_TELEFON)");
		dm->QLiber->ParamByName("SECTOR_ID")->AsInteger = SectorIds[ComboBox1->ItemIndex];
		dm->QLiber->ParamByName("MODEL_ID")->AsInteger = DeviceIds[ComboBox3->ItemIndex];
		dm->QLiber->ParamByName("PROBLEMA_ID")->AsInteger = ProblemaIds[ListBox1->ItemIndex];
		dm->QLiber->ParamByName("NUME")->AsString = Edit1->Text;
		dm->QLiber->ParamByName("PRENUME")->AsString = Edit2->Text;
		dm->QLiber->ParamByName("VARSTA")->AsInteger = SpinEdit1->Value;
		dm->QLiber->ParamByName("NR_TELEFON")->AsString = Edit3->Text;
		dm->QLiber->ExecSQL();

		ResetIds();
		SpeedButton2Click(Sender); //buton anulare (pt clear)
	}
}
//---------------------------------------------------------------------------

void __fastcall TFMain::RequestsShow(TObject *Sender)
{
	dm->QRequest->Close();
	dm->QRequest->Open();
}
//---------------------------------------------------------------------------

void __fastcall TFMain::DBGrid1CellClick(TColumn *Column)
{
	int gest = dm->QRequest->FieldByName("gestionat")->AsInteger;

	if (gest == 0)
		RadioButton1->Checked = true;
	else if (gest == 1)
		RadioButton2->Checked = true;
	else if (gest == 2)
		RadioButton3->Checked = true;

	int pret = dm->QRequest->FieldByName("pret")->AsInteger;
	Edit4->Text = pret;

	Label16->Caption = dm->QRequest->FieldByName("client_id")->AsInteger;
}
//---------------------------------------------------------------------------




void __fastcall TFMain::SpeedButton3Click(TObject *Sender)
{
	dm->QLiber->Close();
	dm->QLiber->SQL->Clear();
	dm->QLiber->SQL->Add("update CLIENT set GESTIONAT = :GESTIONAT, DATA_GESTIONAT = GETDATE(), PRET = :PRET where CLIENT_ID = :CLIENT_ID");
	if(RadioButton1->Checked)
		dm->QLiber->ParamByName("GESTIONAT")->AsInteger = 0;
	else if(RadioButton2->Checked)
		dm->QLiber->ParamByName("GESTIONAT")->AsInteger = 1;
	else
		dm->QLiber->ParamByName("GESTIONAT")->AsInteger = 2;
	dm->QLiber->ParamByName("pret")->AsInteger = Edit4->Text.ToInt();
	dm->QLiber->ParamByName("client_id")->AsInteger = dm->QRequest->FieldByName("client_id")->AsInteger;
	dm->QLiber->ExecSQL();

	dm->QRequest->Close();
	dm->QRequest->Open();

    ShowMessage("Modificare Cu Succes!");
}
//---------------------------------------------------------------------------


void __fastcall TFMain::ModeleTelefonShow(TObject *Sender)
{
	dm->TFrima->Close();
	dm->TFrima->Open();

    dm->TModel->Close();
	dm->TModel->Open();
}
//---------------------------------------------------------------------------

void __fastcall TFMain::SpeedButton4Click(TObject *Sender)
{
	dm->frxReport1->ShowReport(true);
}
//---------------------------------------------------------------------------

void __fastcall TFMain::SpeedButton5Click(TObject *Sender)
{
	dm->frxReport2->ShowReport(true);
}
//---------------------------------------------------------------------------

void __fastcall TFMain::Image1Click(TObject *Sender)
{
    FInfo->ShowModal();
}
//---------------------------------------------------------------------------

