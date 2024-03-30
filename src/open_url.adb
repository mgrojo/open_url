with Ada.Command_Line;
with Ada.Text_IO;

with Config;

with Sf.Window.Clipboard;

with Spawn.Processes;
with Spawn.Processes.Monitor_Loop;
with Spawn.String_Vectors;

procedure Open_URL is

   procedure Launch_URL (URL : String) is
      Process : Spawn.Processes.Process;
      Args : Spawn.String_Vectors.UTF_8_String_Vector;
      use type Spawn.Processes.Process_Status;
   begin
      Ada.Text_IO.Put_Line ("Opening " & URL);

      Process.Set_Program ("/usr/bin/xdg-open");
      Args.Append (URL);
      Process.Set_Arguments (Args);
      Process.Start;

      while Process.Status /= Spawn.Processes.Not_Running loop
         Spawn.Processes.Monitor_Loop (1);
      end loop;
   end Launch_URL;

   Clipboard_Switch : constant String := "--clipboard";
   URL_File : Config.Configuration;
begin

   if Ada.Command_Line.Argument_Count /= 1
   then
      Ada.Text_IO.Put_Line ("Error: Incorrect number of arguments.");
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put_Line ("Usage: " & Ada.Command_Line.Command_Name
                              & " <file.url> | " & Clipboard_Switch);
      return;
   end if;

   if Ada.Command_Line.Argument (1) = Clipboard_Switch then

      Launch_URL (Sf.Window.Clipboard.getString);
   else

      Config.Init (URL_File, Ada.Command_Line.Argument (1));

      Launch_URL (Config.Value_Of (Cfg => URL_File,
                                   Section => "InternetShortcut",
                                   Mark => "URL"));
   end if;

end Open_URL;
