with Ada.Command_Line;
with Ada.Text_IO;

with Config;

with Spawn.Processes;
with Spawn.Processes.Monitor_Loop;
with Spawn.String_Vectors;

procedure Open_URL is
   URL_File : Config.Configuration;
   Process : Spawn.Processes.Process;
   Args : Spawn.String_Vectors.UTF_8_String_Vector;
   use type Spawn.Processes.Process_Status;
begin

   if Ada.Command_Line.Argument_Count /= 1
   then
      Ada.Text_IO.Put_Line ("Error: Missing URL file");
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put_Line ("Usage: " & Ada.Command_Line.Command_Name
                              & " <file.url>");
      return;
   end if;

   Config.Init (URL_File, Ada.Command_Line.Argument (1));

   Launch_URL :
   declare
      URL : constant String := Config.Value_Of (Cfg => URL_File,
                                                Section => "InternetShortcut",
                                                Mark => "URL");
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

end Open_URL;
