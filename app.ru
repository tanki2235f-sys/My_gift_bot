import os
import telebot
from http.server import BaseHTTPRequestHandler, HTTPServer
from threading import Thread

# --- ВСТАВЬ СВОЙ ТОКЕН СЮДА ---
TOKEN = "8648389224:AAGffMWUe3cMo2uTN7h13c7TXkZkGB8wj7s"
# -------------------------------

bot = telebot.TeleBot(TOKEN)

@bot.message_handler(commands=['start'])
def start(message):
    bot.reply_to(message, "Бот работает! Я на связи.")

# Этот блок нужен, чтобы Render думал, что это веб-сайт, и не выдавал ошибку
class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"OK")

def run_server():
    # Render сам выдает порт в переменную PORT
    port = int(os.environ.get("PORT", 10000))
    server = HTTPServer(("0.0.0.0", port), Handler)
    server.serve_forever()

if __name__ == '__main__':
    # Запускаем фейковый сервер в фоне
    Thread(target=run_server, daemon=True).start()
    # Запускаем самого бота
    bot.infinity_polling()
