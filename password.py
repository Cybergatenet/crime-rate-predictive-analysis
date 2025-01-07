from passlib.hash import sha256_crypt

# The password you want to hash
password = "chilz111"

# Generate the hashed password
hashed_password = sha256_crypt.hash(password)

# Print the hashed password
print(hashed_password)
