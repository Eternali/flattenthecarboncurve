import matplotlib.pyplot as plt
import pandas as pd

class DataSource:
	def __init__(self, csvName):
		self.csvName = csvName

	def create_df():
		df = pd.read_csv(self.csvName)
		return df

	
