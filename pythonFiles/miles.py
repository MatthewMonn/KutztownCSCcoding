#
# miles.py
# - converts distance in miles to kilometers.
#

# conversion factor
KM_PER_MILE= 1.609  # km in a mile

# get the distance in miles
miles= input("Enter the distance in miles: ")

# calculate the kilometers
# note: convert the miles string to a number
kms= KM_PER_MILE * float(miles)

# output the results
print("The distance in miles is:",miles)
print("The distance in kilometers is:",kms)
