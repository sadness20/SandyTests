with obj_pers
{
    Socket = network_create_socket(network_socket_tcp);
    isConnected = network_connect(Socket, "127.0.0.1", 8000);
    Buffer = buffer_create(320, buffer_fixed, 1);
            
    if(isConnected < 0)
    {
		//failed to connect
        network_destroy(Socket);
        buffer_delete(Buffer)
        //alarm[2] = -1;
    }
    else
    {
        Result = 0;
        online = 1;
        //global.menuOption = -1;
        select = 0;
    }
}