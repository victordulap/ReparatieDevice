//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Udm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "frxClass"
#pragma link "frxDBSet"
#pragma resource "*.dfm"
Tdm *dm;
//---------------------------------------------------------------------------
__fastcall Tdm::Tdm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
