program lab_08;

{$APPTYPE CONSOLE}

uses
  SysUtils;

{$L ppstart.obj}
procedure start; external;

{$L count.obj}
function count : longword; external;

{$L setcler.obj}
procedure setcler; external;

{$L x_u_y.obj}
procedure x_u_y; external;

{$L x_y.obj}
procedure x_y; external;

begin

asm
  call start
end;

end.
