function fusp_fd = startup_fusp_lite(p)
%STARTUP_FUSP_LITE  Opens TCPIP port with fusp server.

client_bufsize = 8192;
if rem(client_bufsize,4)
    error('client_bufsize(%d) is not a multiple of 4',client_bufsize);
end

if p.fusp_init.port_number == -1
    fusp_fd = -1;
else
    fusp_fd = tcpip(p.fusp_ip,p.fusp_init.port_number);
    set(fusp_fd,'InputBufferSize',client_bufsize);
    set(fusp_fd,'OutputBufferSize',client_bufsize);
    fopen(fusp_fd);
    set(fusp_fd,'ByteOrder','LittleEndian');
end
send_command_to_fusp(fusp_fd,'Fusp server started');
fusp_new_cpset(fusp_fd,sprintf('client_bufsize(%d)',client_bufsize));