# -*- coding: utf-8 -*-
"""
Created on Sat Jun  6 16:15:58 2015

@author: noam
"""

import numpy as np
import matplotlib.pyplot as plt

#%%
lambda_0 = 3
w = np.linspace(2, 7, num=50)
psi = (2*np.pi)**(-0.5) * w * np.sinc(np.pi**(-1)*0.25*(1 - (lambda_0 / w) ** 2)**(-0.5))

#%%
plt.plot(w, psi)