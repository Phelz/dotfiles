import pathlib

DIR_PATH = pathlib.Path(__file__).parent

STYLE_SHEETS_PATHS = list(DIR_PATH.glob("*.mplstyle"))