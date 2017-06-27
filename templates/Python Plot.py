# -*- coding: utf-8 -*-
"""
Project: Optical Materials
Module: Snippets-plotting
Written By: Prasad Tengse
To get a nice multi-y-line plot using matplotlib.pyplot.
Greek chars, symbols and subscripts and superscripts can be added using latex style references.
Please ensure that fonts you use are installed in your system. 
Default fonts are ubuntu family fonts found @ http://font.ubuntu.com/
"""
import numpy as np
import matplotlib.pyplot as plt

plt.clf()
plt.figure(1)
ax=plt.gca()
ax.plot(x,y-1,color='r',label='label1');
ax.plot(x,y-2,color='g',label='label2');
plt.rcParams['font.family'] = 'serif'
plt.rcParams['font.serif'] = 'Ubuntu'
plt.rcParams['font.monospace'] = 'Ubuntu Mono'
plt.rcParams['font.size'] = 13
plt.rcParams['axes.labelsize'] = 12
plt.rcParams['axes.labelweight'] = 'normal'
plt.rcParams['xtick.labelsize'] = 8
plt.rcParams['ytick.labelsize'] = 8
plt.rcParams['legend.fontsize'] = 11
plt.xlabel('X-axis-label')
plt.ylabel('Y-axis-label')
plt.title('Some Title, With $\lambda_s$ ')
plt.grid(True)
ax_lim=plt.axis()
legend = plt.legend(loc='upper right', shadow=False)
plt.savefig("File-in-png.png")
plt.savefig("File-in-eps-for-high-rs.eps",format="eps", dpi=1000)
#
plt.show()
