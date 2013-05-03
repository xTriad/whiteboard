require 'guard'

# This line works, but watches at whiteboard root dir:
# Guard.start(:guardfile => 'storage/Guardfile')

# Watches at /storage
Guard.start(:watchdir => 'storage')