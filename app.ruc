import os
from http.server import BaseHTTPRequestHandler, HTTPServer
from threading import Thread
import telebot

# Твой токен
TOKEN = os.environ.get('TELEGRAM_TOKEN', 'ВСТАВЬ_ТОКЕН_СЮДА')
bot = telebot.TeleBot(TOKEN)

@bot.message_handler(commands=['start'])
def start(message):
    bot.reply_to(message, "Бот работает!")

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"OK")

def run_server():
    port = int(os.environ.get("PORT", 10000))
    server = HTTPServer(("0.0.0.0", port), Handler)
    server.serve_forever()

if __name__ == '__main__':
    Thread(target=run_server, daemon=True).start()
    bot.infinity_polling()
