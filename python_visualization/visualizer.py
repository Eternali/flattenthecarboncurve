"""
----------------------------------
Data Sources Used:
GHG Emissions over the years in Canada: https://open.canada.ca/data/en/dataset/360f5314-b4fb-4c81-bef8-adacd09bbe76
GHG Emissions over the years Globally: https://www.co2.earth/historical-co2-datasets

Conclusion: GHG emissions on the rise, action is required.
----------------------------------
"""
import matplotlib.pyplot as plt
import pandas as pd

class DataSource:
	def __init__(self, csvName):
		self.csvName = csvName
		self.df = pd.read_csv(csvName)

	def scatter_plot(self, x_param, y_param, title):
		ax = self.df.plot.scatter(x=x_param, y=y_param, c='DarkBlue', title=title)
		plt.savefig(title+" - Scatter")

	def bar_chart(self, x_param, y_param, title):
		ax = self.df.plot.bar(x=x_param, y=y_param, color='mediumpurple', title=title)
		plt.savefig(title+" - Bar")



canada = DataSource('GHG-emissions-national-en.csv')
canada.scatter_plot('Year', 'Total GHG Emissions', 'GHG Emissions Over the Years in Canada')
canada.bar_chart('Year', 'Total GHG Emissions', 'GHG Emissions Over the Years in Canada')
world = DataSource('GHG-emissions-global-en.csv')
world.scatter_plot('Year', 'Total GHG Emissions', 'GHG Emissions Over the Years Globally')
world.bar_chart('Year', 'Total GHG Emissions', 'GHG Emissions Over the Years in Globally')



