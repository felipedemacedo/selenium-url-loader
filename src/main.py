from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from argparse import ArgumentParser
import time
from selenium.webdriver.chrome.options import Options
from pyvirtualdisplay import Display


display = Display(visible=0, size=(800, 800))  
display.start()


# Loads argument
parser = ArgumentParser()
parser.add_argument("-u", "--url", dest="URL",
                    help="URL to be loaded in browser", metavar="URL")
args = parser.parse_args()


# Loads Chrome Driver
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument('--no-sandbox')
chrome_options.add_argument('--headless')
chrome_options.add_argument('--disable-gpu')
driver = webdriver.Chrome(ChromeDriverManager().install(), chrome_options=chrome_options)
if not driver:
    print("Could not load Chrome Driver.")
    exit(1)


if __name__ == "__main__":
    try:
        # print("URL RECEIVED AS ARGUMENT: [", args.URL, "]")
        driver.maximize_window()
        begin = time.time()
        driver.get(str(args.URL))
        print(f"WEBSITE_LOADING_TIME:{time.time() - begin}")
    except Exception as e:
        print(e)
    finally:
        driver.close()