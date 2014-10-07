function [port_number] = get_port_number(basedir)
%GET_PORT_NUMBER  Get available port number.

if nargin < 1, basedir = cd; end

base_port_number = 51717;
portfilename = 'last_port_used.txt';
portfile = fullfile(basedir,portfilename);
fpportn = fopen(portfile,'r');
if fpportn == -1
  fpportn = fopen(portfile,'w');
  if fpportn == -1
    error('cannot open %s file',portfilename);
  end
  fprintf(fpportn,'%d\n',base_port_number);
  fclose(fpportn);
  fpportn = fopen(portfile,'r');
  if fpportn == -1
    error('cannot find %s file',portfilename);
  end
end
last_port_number = fscanf(fpportn,'%d');
fclose(fpportn);
port_number = last_port_number + 1;
if port_number > base_port_number + 5
  port_number = base_port_number;
end
fpportn = fopen(portfile,'w');
fprintf(fpportn,'%d\n',port_number);
fclose(fpportn);

end