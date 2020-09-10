//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ULogare.h"
#include "UMain.h"
#include "Udm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFLogare *FLogare;
//---------------------------------------------------------------------------
__fastcall TFLogare::TFLogare(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFLogare::SpeedButton1Click(TObject *Sender)
{
	FLogare->Close();
	FMain->AlphaBlend = false;
	FMain->AlphaBlendValue = 255;

	FMain->Client->TabVisible = true;
	FMain->Requests->TabVisible = false;
	FMain->Admin->TabVisible = false;
}
//---------------------------------------------------------------------------

void __fastcall TFLogare::SpeedButton3Click(TObject *Sender)
{
	Application->Terminate();
}
//---------------------------------------------------------------------------

void __fastcall TFLogare::SpeedButton2Click(TObject *Sender)
{
	if(!Edit1->Text.IsEmpty() && !Edit2->Text.IsEmpty())
	{
		dm->QLogare->Close();
		dm->QLogare->ParamByName("LOGIN")->AsString = Edit1->Text;
		dm->QLogare->ParamByName("PASSWORD")->AsString = Edit2->Text;
		dm->QLogare->Open();

		if(!dm->QLogare->IsEmpty())
		{
            FLogare->Close();
			FMain->AlphaBlend = false;
			FMain->AlphaBlendValue = 255;

			if(dm->QLogare->FieldByName("tip_acces")->AsInteger == 1)
			{
				FMain->Client->TabVisible = false;
				FMain->Requests->TabVisible = true;
				FMain->Admin->TabVisible = false;
			}
			else
			{
				FMain->Client->TabVisible = true;
				FMain->Requests->TabVisible = true;
				FMain->Admin->TabVisible = true;
			}
		}
		else
		{
			ShowMessage("Login or password incorrect!");
        }
	}
	else
	{
		ShowMessage("Introdu datele!");
	}
}
//---------------------------------------------------------------------------

