#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;
  
out vec3 Normal;
out vec2 TexCoords;
out vec3 FragPos;
  
uniform mat4 proj;
uniform mat4 view;
uniform mat4 model;

void main()
{
    gl_Position = proj * view * model * vec4(aPos, 1.0f);
	Normal = mat3(transpose(inverse(model))) * aNormal; // TODO: calculate the transpose inverse model on the CPU instead
	TexCoords = aTexCoords;
	
	FragPos = vec3(model * vec4(aPos, 1.0));
} 