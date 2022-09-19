from glob import glob
import re

def open_file(path):
    with open(path, mode='r' , encoding='utf_8') as f:
        data = f.read()
        return data

def save_file(path, data):
    with open(path, mode='w', encoding='utf_8') as f:
        f.write(data)

PTN = "<p align='center'>\n.*\n</p>"
def remove_links(html):
    return re.sub(PTN, '', html)

def replace_links(html):
    return html.replace('.md', '.html')

def main():
    pth = glob('docs/*.html')
    typ_pth = glob('docs/type/*.html')
    typ_adv_pth = glob('docs/type/advanced/*.html')
    paths = pth + typ_pth + typ_adv_pth
    for path in paths:
        print(path)
        html = open_file(path)
        html = remove_links(html)
        save_file(path, html)

if __name__ == '__main__':
    main()
