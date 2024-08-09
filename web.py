import asyncio
import websockets
import webbrowser

async def handle_command(websocket, path):
    async for message in websocket:
        if message == 'web':
            webbrowser.open('https://www.google.com')
        elif message == 'spreadsheet':
            webbrowser.open('https://docs.google.com/spreadsheets')
        elif message == 'whatsapp':
            webbrowser.open('https://web.whatsapp.com')

start_server = websockets.serve(handle_command, "0.0.0.0", 8080)

asyncio.get_event_loop().run_until_complete(start_server)
asyncio.get_event_loop().run_forever()