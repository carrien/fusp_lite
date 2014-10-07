function ffd = startup_fusp_lite(p)
%STARTUP_FUSP_LITE  Opens TCPIP port with fusp server.
%   STARTUP_FUSP_LITE(P) opens a TCP/IP port given the parameters in P,
%   returning the fusp file descriptor FFD.

client_bufsize = 8192;
if rem(client_bufsize,4)
    error('client_bufsize(%d) is not a multiple of 4',client_bufsize);
end

if p.fusp_init.port_number == -1
    ffd = -1;
else
    ffd = tcpip(p.fusp_ip,p.fusp_init.port_number);
    set(ffd,'InputBufferSize',client_bufsize);
    set(ffd,'OutputBufferSize',client_bufsize);
    fopen(ffd);
    set(ffd,'ByteOrder','LittleEndian');
end
send_command_to_fusp(ffd,'Fusp server started');
fusp_new_cpset(ffd,sprintf('client_bufsize(%d)',client_bufsize));