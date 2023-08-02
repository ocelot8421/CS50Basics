import os
import qrcode

print("Coco")

## Print the current working directory (CWD)
# cwd = os.getcwd()
# print("Current working directory:", cwd)

img = qrcode.make("https://github.com/ocelot8421")
img.save("qr.png", "PNG")  # PNG = Portable Network Graphic

# os.system("open qr.png")  #Mac
os.system("start qr.png")  # Windows
