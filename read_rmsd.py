import pandas as pd
import sys
import matplotlib.pyplot as plt
def read_rmsd(rmsd_file):
    with open(rmsd_file) as f:
        lines=f.readlines()
        # Extract two numbers from each line and store them in a list of tuples
        data = [tuple(map(float, line.split())) for line in lines[1:]]
        # Create a DataFrame from the list of tuples
        df = pd.DataFrame(data, columns=['#Frame', 'RMSD'])
        df['#Frame']=df['#Frame'].astype(int)
        df['RMSD']=df['RMSD'].astype(float)
        df.loc[:700, 'Time(ns)'] = df['#Frame'][:701] * 0.01
        df.loc[700:900, 'Time(ns)'] = (df['#Frame'][700:901]-700)*1+7
        df['Time(ns)']=df['Time(ns)'].astype(int)
        df.to_csv("rmsd_df.csv")
        plt.plot(df['Time(ns)'], df['RMSD'])
        plt.xlabel('Time(ns)')
        plt.xticks(range(0, max(df['Time(ns)'])+1, 40))
        plt.ylabel('RMSD')
        plt.title('RMSD vs Time(ns)')
        plt.savefig('rmsd_plot.png',dpi=600)


if __name__=="__main__":
    rmsd_file=sys.argv[1]
    read_rmsd(rmsd_file)
