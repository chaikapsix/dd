from aiogram import Bot, Dispatcher, executor, types
from aiogram.types import ReplyKeyboardRemove, ReplyKeyboardMarkup, KeyboardButton
from aiogram.types import InlineKeyboardMarkup, InlineKeyboardButton


API_TOKEN = ''

urlkb = InlineKeyboardMarkup(row_width=1)
urlButton = InlineKeyboardButton(text='А не пойти бы тебе учиться', url='https://ya.ru')
urlButton2 = InlineKeyboardButton(text='Учица Смерд БЫСТРА', url='https://google.com')
urlkb.add(urlButton,urlButton2)

bot = Bot(token=API_TOKEN)
dp = Dispatcher(bot)

@dp.message_handler(commands='ссылки')
async def url_command(message: types.Message):
   await message.answer('Полезные ссылки:', reply_markup=urlkb)
 
@dp.message_handler(commands=['help'])
async def send_welcome(message: types.Message):
   await message.reply("А хуху не хуху или хуяк хуяк и хомяк. А ?")
 
@dp.message_handler(commands=['start'])
async def send_welcome(message: types.Message):
   kb = [
       [
           types.KeyboardButton(text="Регистрация"),
           types.KeyboardButton(text="Добавить IP"),
           types.KeyboardButton(text="Добавить URL")
       ],
   ]
   keyboard = types.ReplyKeyboardMarkup(keyboard=kb)
 
   await message.reply("Привет!\nНу и хули ты мне строчишь иди бухай.", reply_markup=keyboard)

@dp.message_handler()
async def echo(message: types.Message):
    if (message.text == "Регистрация"):
        await message.answer("Привет!\nНу и хули ты мне строчишь иди бухай.")
    if (message.text == "Добавить IP"):
        await message.answer("Вот это нихуя себе ты придумал\nИди бухай.")       
    if (message.text == "Добавить URL"):
        await message.answer("Вот это нихуя себе ты придумал\nИди бухай.")

if __name__ == '__main__':
   executor.start_polling(dp, skip_updates=True)