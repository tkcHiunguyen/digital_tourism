import * as THREE from 'three';
import { GLTFLoader } from '/jsm/loaders/GLTFLoader.js';
import { OrbitControls } from '/jsm/controls/OrbitControls.js';
import { FBXLoader } from '/jsm/loaders/FBXLoader.js';
import { Color, Sphere, TetrahedronGeometry } from 'three';
import { OBJLoader } from '/jsm/loaders/OBJLoader.js';

const point = document.querySelector('.pointer')
const aspect = window.innerWidth / window.innerHeight  //tỉ lệ hiển thị
const near = 0.21  //giới bạn gần
const far = 200  //giới hạn xa
const camera = new THREE.PerspectiveCamera(65, aspect, near, far);
const scene = new THREE.Scene();
const container = document.body
const canvas = document.querySelector('#canvas')
const webgl = document.querySelector('.web-gl')
const renderer = new THREE.WebGLRenderer({ canvas, antialias: true });
const width = canvas.clientWidth
const height = canvas.clientHeight
const orbit = new OrbitControls(camera, renderer.domElement)
const rayCaster = new THREE.Raycaster()
let pointActive = false
const btnHide = document.getElementById('btnHide')
const iconElement = document.getElementById('iconElement');
const modelFrame = document.querySelector('.modelFrame')
const embedWrapper = document.querySelector('.sketchfab-embed-wrapper')
const close3d = document.querySelector('.modelFrame .fa-circle-xmark')
const subFrameTitle = document.getElementById('subFrame-h2')
const subFrameContent = document.getElementById('subFrame-para')
const pElement = document.createElement("p"); // Tạo phần tử <p>
const infoVideo = document.getElementById("introVideo")
var pointerGroup = []
var pointer3DGroup = []
//var spriteVisible = true
// Fetch the view data from the API based on the provided ID
fetch('/api/view/' + id)
    .then(response => response.json())
    .then(data => {
        let data1 = data;
        // Iterate over the data array
        data1.map(function (data1) {
            console.log(data1.ID);
            const backgroundLoad = new THREE.TextureLoader()
            backgroundLoad.load(data1.image, function (texture) {
                const rt = new THREE.WebGLCubeRenderTarget(texture.image.height)
                rt.fromEquirectangularTexture(renderer, texture)
                scene.background = rt.texture
            })
            const geometry = new THREE.SphereGeometry(50, 32, 32); // Tạo geometry cho khối cầu với bán kính lớn
            const material = new THREE.MeshBasicMaterial({
                transparent: true,
                opacity: 0,
                side: THREE.DoubleSide
            });
            geometry.scale(1, 1, 1);
            const sphere = new THREE.Mesh(geometry, material); // create geometry by material
            scene.add(sphere); // add geometry to scene


            // Load texture and create material for the sphere
            // const texture = new THREE.TextureLoader().load(data1.image);
            // const material = new THREE.MeshBasicMaterial({
            //     map: texture,
            //     side: THREE.DoubleSide
            // });
            // // Configure texture wrapping and repeating
            // texture.wrapS = THREE.RepeatWrapping;
            // texture.repeat.x = -1;
            // // Create the sphere mesh using the provided geometry and material
            // const sphere = new THREE.Mesh(geometry, material);

            // // Scale the geometry
            // geometry.scale(1, 1, 1);

            // // Add the sphere mesh to the scene
            // scene.add(sphere);


            // Set the camera position
            camera.position.set(-0.1, 0, 0);

            const ambient = new THREE.AmbientLight(0x404040, 5)  //nguồn sáng
            scene.add(ambient)

            // Set the size of the renderer
            renderer.setSize(window.innerWidth, window.innerHeight);

            // Set the animation loop for the renderer
            renderer.setAnimationLoop(animation);

            // Append the renderer canvas to the container element
            container.appendChild(renderer.domElement);

            // Disable zoom and pan for the orbit controls
            orbit.enableZoom = false;
            orbit.enablePan = false;
            orbit.update();

            // Add event listener for mousewheel events
            document.addEventListener('mousewheel', on_mouse_wheel, false);

            // Add event listener for resize events
            window.addEventListener('resize', resize);

            // Add click event listener for close3d element
            close3d.addEventListener('click', on_close_frame_3d);

            // Fetch the point data from the API based on the view ID

            fetch('/api/point/' + data1.ID)
                .then(response => response.json())
                .then(eachPoint => {
                    let pointList = eachPoint;
                    // Iterate over the pointList array
                    pointList.map(function (eachPoint) {
                        console.log(eachPoint);
                        // Add a pointer using the provided position, name, href, info, and type
                        add_pointer(new THREE.Vector3(
                            eachPoint.x,
                            eachPoint.y,
                            eachPoint.z
                        ),
                            eachPoint.name, eachPoint.href, eachPoint.info, eachPoint.type);
                    });
                });

            // Fetch the 3D model data from the API based on the view ID
            fetch('/api/3dmodel/' + data1.ID)
                .then(response => response.json())
                .then(data => {
                    let list3D = data;
                    // Iterate over the list3D array
                    list3D.map(function (each3D) {
                        console.log(each3D);
                        // Add a 3D pointer using the provided position, name, embedded data, and type
                        add_pointer_3D(new THREE.Vector3(
                            each3D.x,
                            each3D.y,
                            each3D.z
                        ),
                            each3D.name,
                            each3D.embedded,
                            '3D');
                    });
                });

            // Add click event listeners for container element
            container.addEventListener('click', on_click_3D, true);
            container.addEventListener('click', on_click, true);
            container.addEventListener('mousemove', on_mouse_move, true);
            btnHide.addEventListener('click', () => {
                if (btnHide.classList.contains("activate")) {
                    container.addEventListener('click', on_click_3D, false);
                    container.addEventListener('click', on_click, false);
                    container.addEventListener('mousemove', on_mouse_move, false);
                }
                else {
                    container.addEventListener('click', on_click_3D, true);
                    container.addEventListener('click', on_click, true);
                    container.addEventListener('mousemove', on_mouse_move, true);
                }
            })

            if (data1.video) {
                infoVideo.src = data1.video
            }
            else {
                fetch('/api/getInfoView/' + data1.parent)
                    .then(response => response.json())
                    .then(data => {
                        let listInfo = data
                        listInfo.map(function (eachInfo) {
                            infoVideo.src = eachInfo.video
                        })
                    })
            }
            if (data1.level == 1) {
                // Split the description into paragraphs
                const paragraphs = data1.description.split("\n");
                // Set the text content of the subFrameTitle element
                subFrameTitle.textContent = data1.view_name;
                //infoVideo.src = data1.video
                // Append paragraph elements to the subFrameContent element
                paragraphs.forEach((paragraph) => {
                    pElement.textContent = paragraph;
                    subFrameContent.appendChild(pElement);
                });
            } else if (data1.level == 2) {
                fetch('/api/getInfoView/' + data1.parent)
                    .then(response => response.json())
                    .then(data => {
                        let listInfo = data
                        listInfo.map(function (eachInfo) {
                            // Split the description into paragraphs
                            const paragraphs_sub = eachInfo.description.split("\n");
                            // Set the text content of the subFrameTitle element
                            subFrameTitle.textContent = eachInfo.view_name;

                            // Append paragraph elements to the subFrameContent element
                            paragraphs_sub.forEach((paragraph) => {
                                pElement.textContent = paragraph;
                                subFrameContent.appendChild(pElement);
                            });
                        })
                    })
            }
        });
    });


function add_pointer(position, name, href, description, type) {

    let pointer = new THREE.TextureLoader().load('/texture/update.png')
    //let pointer = new THREE.TextureLoader().load('/img/marker/square-green.jpg')
    let pointerMaterial = new THREE.SpriteMaterial(
        {
            map: pointer,
            color: 0xffffff,
            transparent: true,
            opacity: 1,
            side: THREE.DoubleSide
        })
    let sprite = new THREE.Sprite(pointerMaterial)
    sprite.name = name
    sprite.href = href
    sprite.description = description
    sprite.typePoint = type
    sprite.position.copy(position.clone().normalize().multiplyScalar(49))
    sprite.scale.multiplyScalar(6)
    scene.add(sprite)

    let model = new GLTFLoader().load('/texture/lowpoly_earth/scene.gltf', function (gltf) {
        let object = gltf.scene
        object.scale.set(0.0003, 0.0003, 0.0003)
        //object.scale.set(2, 2, 2)
        object.position.copy(position.clone().normalize().multiplyScalar(49))
        object.visible = true
        pointerGroup.push(object)
        scene.add(object)
    })

    let spriteVisible = true

    //--------------SHOW/HIDE POINTER--------------
    btnHide.addEventListener('click', () => {
        if (spriteVisible == true) {
            sprite.visible = false;
            for (var i = 0; i < pointerGroup.length; i++) {
                var object = pointerGroup[i];
                // var mesh = object.children[0];
                object.visible = false;
            }
            spriteVisible = false;
            btnHide.textContent = 'Hiện Icon';
            iconElement.className = 'fa-solid fa-eye';
            btnHide.classList.add('activate')
            btnHide.innerHTML = '<i id="iconElement" class="fa-solid fa-eye"></i>&nbsp;Hiện Icon';

        } else {
            sprite.visible = true;
            for (var i = 0; i < pointerGroup.length; i++) {
                var object = pointerGroup[i];
                object.visible = true;
            }
            spriteVisible = true;
            iconElement.className = 'fa-solid fa-eye-slash';
            btnHide.classList.add('activate')
            btnHide.innerHTML = '<i id="iconElement" class="fa-solid fa-eye-slash"></i>&nbsp;Ẩn Icon';
        }
    });
    //-------------------------------------------------------
}
function add_pointer_3D(position, name, embedded, type) {
    let pointer3D = new THREE.TextureLoader().load('/texture/3d-icon.jpg')
    // let pointer3D = new THREE.TextureLoader().load('/img/marker/square-red.jpg')
    let pointerMaterial = new THREE.SpriteMaterial({
        map: pointer3D,
        color: 0xffffff,
        transparent: true,
        opacity: 1,
        side: THREE.DoubleSide
    })
    let sprite3D = new THREE.Sprite(pointerMaterial)
    sprite3D.name = name
    sprite3D.embedded = embedded
    sprite3D.typePoint = type
    sprite3D.position.copy(position.clone().normalize().multiplyScalar(49))
    sprite3D.scale.multiplyScalar(4)
    scene.add(sprite3D)
    let spriteVisible = true

    let model = new GLTFLoader().load('/texture/cat_box_meme/scene.gltf', function (gltf) {
        let object = gltf.scene
        object.scale.set(0.001, 0.001, 0.001)
        //object.scale.set(0.1, 0.1, 0.1)
        object.position.copy(position.clone().normalize().multiplyScalar(49))
        pointer3DGroup.push(object)
        scene.add(object)
    })
    //--------------SHOW/HIDE POINTER--------------
    btnHide.addEventListener('click', () => {
        if (spriteVisible) {
            sprite3D.material.visible = false;
            for (var i = 0; i < pointer3DGroup.length; i++) {
                var object = pointer3DGroup[i];
                // var mesh = object.children[0];
                object.visible = false;
            }
            spriteVisible = false;
            btnHide.textContent = 'Hiện Icon';
            btnHide.classList.add('activate')
            iconElement.className = 'fa-solid fa-eye';
            btnHide.innerHTML = '<i id="iconElement" class="fa-solid fa-eye"></i>&nbsp;Hiện Icon';

        } else {
            sprite3D.material.visible = true;
            for (var i = 0; i < pointer3DGroup.length; i++) {
                var object = pointer3DGroup[i];
                object.visible = true;
            }
            spriteVisible = true;
            iconElement.className = 'fa-solid fa-eye-slash';
            btnHide.classList.remove('activate')
            btnHide.innerHTML = '<i id="iconElement" class="fa-solid fa-eye-slash"></i>&nbsp;Ẩn Icon';
        }
    });
    //-------------------------------------------------------
}
function resize() {
    camera.aspect = window.innerWidth / window.innerHeight
    camera.updateProjectionMatrix()
    renderer.setSize(window.innerWidth, window.innerHeight)
}
function animation(time) {
    for (let i = 0; i < pointerGroup.length; i++) {
        pointerGroup[i].rotation.y += 0.07;
    }
    for (let i = 0; i < pointer3DGroup.length; i++) {
        pointer3DGroup[i].rotation.y -= 0.07;
    }
    renderer.render(scene, camera)
    orbit.update()
}
function on_mouse_wheel(event) {
    if (event.target.closest('.web-gl')) {               //ngăn zoom ảnh khi rê chuột đến phẩm tử thông tin
        const fov = camera.fov + event.deltaY * 0.05;
        camera.fov = THREE.MathUtils.clamp(fov, 10, 65);
        camera.updateProjectionMatrix();
    }
}
function on_click(e) {
    //if (spriteVisible == true) {
    let mouse = new THREE.Vector2(
        (e.clientX / window.innerWidth) * 2 - 1,
        -(e.clientY / window.innerHeight) * 2 + 1
    )
    rayCaster.setFromCamera(mouse, camera)
    let intersects = rayCaster.intersectObjects(scene.children, true)
    // console.log(intersects)
    // let intersects = rayCaster.intersectObject(sphere)
    if (intersects.length > 0) {
        console.log(intersects[0])
        // add_pointer(intersects[0].point)
    }

    intersects.forEach(function (intersect) {
        if (intersect.object.type == 'Sprite' && intersect.object.href) {
            // console.log(intersect.object)
            window.location.href = intersect.object.href
            // history.pushState({}, '', intersect.object.href);
            // // Gọi hàm để tải nội dung mới từ đường dẫn cụ thể
            // loadData(intersect.object.href);
        }
    })
    //}
}
function on_click_3D(e) {
    //if (spriteVisible == true) {
    let mouse = new THREE.Vector2(
        (e.clientX / window.innerWidth) * 2 - 1,
        -(e.clientY / window.innerHeight) * 2 + 1
    )
    rayCaster.setFromCamera(mouse, camera)
    let intersects = rayCaster.intersectObjects(scene.children)
    intersects.forEach(function (intersect) {
        if (intersect.object.type === 'Sprite' && intersect.object.typePoint == '3D') {
            // console.log(intersect)
            modelFrame.style.display = 'block'
            toggle_frame_3D(intersect.object)
        }
    })
    //}
}
function create_iframe(model3D) {
    const iframe = document.createElement('iframe');
    iframe.title = 'Corsair Jet';
    iframe.frameBorder = '0';
    iframe.allowFullscreen = true;
    iframe.mozallowfullscreen = true;
    iframe.webkitallowfullscreen = true;
    iframe.allow = 'autoplay; fullscreen; xr-spatial-tracking';
    iframe.setAttribute('xr-spatial-tracking', '');
    iframe.setAttribute('execution-while-out-of-viewport', '');
    iframe.setAttribute('execution-while-not-rendered', '');
    iframe.setAttribute('web-share', '');
    iframe.width = '646';
    iframe.height = '446';
    iframe.src = model3D.embedded;
    return iframe;
}
function on_mouse_move(e) {
    let mouse = new THREE.Vector2(
        (e.clientX / window.innerWidth) * 2 - 1,
        -(e.clientY / window.innerHeight) * 2 + 1
    )
    rayCaster.setFromCamera(mouse, camera)
    let foundSprite = false
    let intersects = rayCaster.intersectObjects(scene.children)
    //if (spriteVisible == true) {
    intersects.forEach(function (intersects) {
        if (intersects.object.type === 'Sprite' && intersects.object.typePoint) {
            let p = intersects.object.position.clone().project(camera)
            point.style.top = ((-1 * p.y + 1) * window.innerHeight / 2) + 'px'
            point.style.left = ((p.x + 1) * window.innerWidth / 2) + 'px'
            point.classList.add('is-active')
            webgl.classList.add('active')
            // point.innerHTML = intersects.object.name + "<br>" + intersects.object.description + "<br>" + intersects.object.typePoint
            pointActive = true
            foundSprite = true
        }
    })
    if (foundSprite === false && pointActive) {
        point.classList.remove('is-active')
        webgl.classList.remove('active')
    }
    //}

}
function on_mouse_move_3D(e) {
    let mouse = new THREE.Vector2(
        (e.clientX / window.innerWidth) * 2 - 1,
        -(e.clientY / window.innerHeight) * 2 + 1
    )
    rayCaster.setFromCamera(mouse, camera)
    let foundSprite = false
    let intersects = rayCaster.intersectObjects(scene.children)
    intersects.forEach(function (intersects) {
        if (intersects.object.type === 'Sprite' && intersects.object.typePoint != '3D') {
            let p = intersects.object.position.clone().project(camera)
            point.style.top = ((-1 * p.y + 1) * window.innerHeight / 2) + 'px'
            point.style.left = ((p.x + 1) * window.innerWidth / 2) + 'px'
            //point.classList.add('is-active')
            webgl.classList.add('active')
            point.innerHTML = intersects.object.name + "<br>" + intersects.object.description + "<br>" + intersects.object.typePoint
            pointActive = true
            foundSprite = true
        }
    })
    if (foundSprite === false && pointActive) {
        //point.classList.remove('is-active')
        webgl.classList.remove('active')
    }
}
function on_close_frame_3d() {
    embedWrapper.innerHTML = '';
    modelFrame.style.display = 'none'
}
function toggle_frame_3D(object) {
    console.log(object)
    if (modelFrame.style.display == 'none') {
        // Nếu modal đang mở, đóng modal và hủy thẻ iframe
        embedWrapper.innerHTML = '';
    } else if (modelFrame.style.display == 'block') {
        // Nếu modal đang đóng, mở modal và tạo thẻ iframe
        const iframe = create_iframe(object);
        embedWrapper.appendChild(iframe);
    }
}

class marker {
    constructor(position, name, href, description, type) {
        this.position = position
        this.name = name
        this.href = href
        this.description = description
        this.type = type
    }
    //let pointer = new THREE.TextureLoader().load('/texture/update.png')
    create_marker() {
        let pointer = new THREE.TextureLoader().load('/img/marker/square-green.jpg')
        let pointerMaterial = new THREE.SpriteMaterial(
            {
                map: pointer,
                color: 0xffffff,
                transparent: true,
                opacity: 0,
                side: THREE.DoubleSide
            })
        let sprite = new THREE.Sprite(pointerMaterial)
        sprite.name = this.name
        sprite.href = href
        sprite.description = description
        sprite.typePoint = type
        sprite.position.copy(position.clone().normalize().multiplyScalar(49))
        sprite.scale.multiplyScalar(9)
        scene.add(sprite)

        let model = new GLTFLoader().load('/texture/lowpoly_earth/scene.gltf', function (gltf) {
            let object = gltf.scene
            //object.scale.set(0.03, 0.03, 0.03)
            object.scale.set(2, 2, 2)
            object.position.copy(position.clone().normalize().multiplyScalar(49))
            object.visible = true
            pointerGroup.push(object)
            scene.add(object)
        })
    }

}