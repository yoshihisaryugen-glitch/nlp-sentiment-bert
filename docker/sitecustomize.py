"""Keep torchtext.data.Field available for these notebooks.

torchtext 0.10 moved Field, TabularDataset, and Iterator to torchtext.legacy.
The notebooks call torchtext.data.Field, so point that name at the legacy module.
"""
import sys
import warnings

warnings.filterwarnings("ignore", message=".*legacy.*", category=UserWarning)

import torchtext
from torchtext.legacy import data as legacy_data

sys.modules["torchtext.data"] = legacy_data
torchtext.data = legacy_data
