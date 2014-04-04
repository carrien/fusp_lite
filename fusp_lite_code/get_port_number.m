function [port_number] = get_port_number(basedir)
%GET_PORT_NUMBER  Get available port number.

if nargin < 1, basedir = cd; end

base_port_number = 51717;
fpportn = fopen([basedir '/last_port_used.txt'],'r');
if fpportn == -1
  fpportn = fopen([basedir '/last_port_used.txt'],'w');
  if fpportn == -1
    error('cannot open last_port_used.txt file');
  end
  fprintf(fpportn,'%d\n',base_port_number);
  fclose(fpportn);
  fpportn = fopen([basedir '/last_port_used.txt'],'r');
  if fpportn == -1
    error('cannot find last_port_used.txt file');
  end
end
last_port_number = fscanf(fpportn,'%d');
fclose(fpportn);
port_number = last_port_number + 1;
if port_number > base_port_number + 5
  port_number = base_port_number;
end
fpportn = fopen([basedir '/last_port_used.txt'],'w');
fprintf(fpportn,'%d\n',port_number);
fclose(fpportn);

end