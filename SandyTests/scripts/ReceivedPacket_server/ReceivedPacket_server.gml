var buffer = argument[0];
var socket = argument[1];
var msgid = buffer_read(buffer, buffer_u8);

switch (msgid - 100) {
    case 1:
        var slot = -1, found = 0;
        for(var i = 0; i < 4; i ++)
        {
            if(global.players[i, 1] == -1)
            {
                slot = i;
                break;
            }
        }
        
        if(slot != -1)
        {
            BufferReadPlayer(slot, socket, buffer);
        }
        else
        {
            //send error message (full)
            break;
        }
        
        
        for(var i = 0; i < 4; i ++)
        {
            var playerSocket = -1;
            playerSocket = global.players[i, 1];
            if(playerSocket != -1 && global.players[i, 1] != socket)
            {
                buffer_seek(Buffer, buffer_seek_start, 0);
                buffer_write(Buffer, buffer_u8, 1);
                
                BufferWritePlayer(slot);
                
                network_send_packet(playerSocket, Buffer, buffer_tell(Buffer)); 
            }
        }
        
        break;
    case 2:
        
        break;
}