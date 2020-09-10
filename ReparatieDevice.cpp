//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("ULogare.cpp", FLogare);
USEFORM("UMain.cpp", FMain);
USEFORM("Udm.cpp", dm);
USEFORM("UInfoMenu.cpp", FInfo);
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		Application->CreateForm(__classid(TFMain), &FMain);
		Application->CreateForm(__classid(TFLogare), &FLogare);
		Application->CreateForm(__classid(Tdm), &dm);
		Application->CreateForm(__classid(TFInfo), &FInfo);
		Application->Run();
	}
	catch (Exception &exception)
	{
		Application->ShowException(&exception);
	}
	catch (...)
	{
		try
		{
			throw Exception("");
		}
		catch (Exception &exception)
		{
			Application->ShowException(&exception);
		}
	}
	return 0;
}
//---------------------------------------------------------------------------