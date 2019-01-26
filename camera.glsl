/**
 * Constructs a RHS camera matrix. 
 * A camera transformation matrix which looks in the -Z direction.
 *
 * @param camera The position of the camera.
 * @param target The position the camera is looking at.
 * @param roll   The roll of the camera. 
 */
mat4 lookAt(vec3 camera, vec3 target, float roll) {
    vec3 up = vec3(sin(roll), cos(roll), 0.0);
    vec3 z = normalize(target - camera);	
    vec3 x = normalize(cross(z, up));
    vec3 y = normalize(cross(x, z));

    return transpose(mat4(
        x, -dot(x, eye), 
        y, -dot(y, eye), 
        -z, dot(z, eye), 
        0, 0, 0, 1
    ));
}   

/**
 * Constructs a perspective projection matrix.
 *
 * @param aspectRatio Width / height apect ratio.
 * @param near        Near plance of the camera.
 * @param far         Far plane of the camera.
 * @param fov         The field of view in radians.
 */
mat4 perspective(float aspectRatio, float near, float far, float fov) {
	float a = aspectRatio;
	float d = 1.0 / tan(0.5 * fov);  // = 1.0 at 90 degrees
	float A = -(far+near)/(far-near);
	float B = -2*far*near/(far-near);

	return mat4(
		d/a, 0, 0, 0,
		0,   d, 0, 0,
		0,   0, A, B,
		0,   0,-1, 1
	);
}
