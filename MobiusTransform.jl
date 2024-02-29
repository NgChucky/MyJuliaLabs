using Pkg
Pkg.add("Makie")

using Makie

# Define the Mobius transformation function
function mobius_transform(z, a, b, c, d)
    return (a*z + b) / (c*z + d)
end

# Define the Mobius transformation parameters
a = 2
b = 1
c = 3
d = -2

# Create a regular grid of points in the complex plane
resolution = 100
x = range(-2, stop = 2, length = resolution)
y = range(-2, stop = 2, length = resolution)
grid = complex.(x', y)

# Create a figure
fig = Figure()

# Create a scatter plot of the original complex plane
scatter!(fig, real(grid), imag(grid), color = :blue, markersize = 2, label = "Original")

# Define the animation function
function animate_mobius_transform(fig, grid, a, b, c, d)
    frames = 50
    for i in 1:frames
        # Apply the Mobius transformation to each point in the grid
        transformed_grid = mobius_transform(grid, a, b, c, d)
        
        # Update the scatter plot with the transformed grid
        scatter!(fig, real(transformed_grid), imag(transformed_grid), color = :red, markersize = 2, label = "Transformed")
        
        # Update the figure
        record(fig)
        
        # Increment Mobius transformation parameters
        a += 0.01
        b += 0.01
        c -= 0.01
        d -= 0.01
    end
end

# Call the animation function
animate_mobius_transform(fig, grid, a, b, c, d)

# Display the figure
display(fig)
