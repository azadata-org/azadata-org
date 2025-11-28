"""
Main application entrypoint if running package as a module
"""

import logging
from src.app import App

logging.basicConfig(level=logging.INFO)

app = App()
app.run()
