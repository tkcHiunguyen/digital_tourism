import * as THREE from 'three';
import { GLTFLoader } from '/jsm/loaders/GLTFLoader.js';
import { OrbitControls } from '/jsm/controls/OrbitControls.js';
import { FBXLoader } from '/jsm/loaders/FBXLoader.js';
import { Color, Sphere, TetrahedronGeometry } from 'three';
import { OBJLoader } from '/jsm/loaders/OBJLoader.js';

const point = document.querySelector('.pointer')
let pointActive = false
//camera
// const fov = 90    //góc mở camera
const aspect = window.innerWidth / window.innerHeight  //tỉ lệ hiển thị
const near = 0.21  //giới bạn gần
const far = 200  //giới hạn xa
const camera = new THREE.PerspectiveCamera(65, aspect, near, far);
camera.position.set(-0.1, 0, 0) // vị trí camera   (x là dịch trái phải, y là trên dưới, z là độ gần xa)
//dụng cảnh
const scene = new THREE.Scene();

const container = document.body
const canvas = document.querySelector('#canvas')
const renderer = new THREE.WebGLRenderer({ canvas, antialias: true });
const width = canvas.clientWidth
const height = canvas.clientHeight
renderer.setSize(width, height);
renderer.setAnimationLoop(animation);
container.appendChild(renderer.domElement);

//xoay vật thể, zoom
const orbit = new OrbitControls(camera, renderer.domElement)
orbit.enableZoom = false
orbit.enablePan = false;   //khóa vị trí camera

orbit.update()



const geometry = new THREE.SphereGeometry(50, 32, 32)
geometry.scale(-1, 1, 1)
const texture = new THREE.TextureLoader().load('/texture/DJI_0415 Panorama.jpg')
texture.wrapS = THREE.RepeatWrapping
texture.repeat.x = -1

const material = new THREE.MeshBasicMaterial({
    map: texture,
    side: THREE.DoubleSide
})
const sphere = new THREE.Mesh(geometry, material)
scene.add(sphere)

function addPointer(position, name, href) {
    let pointer = new THREE.TextureLoader().load('/texture/pointer.png')
    let pointerMaterial = new THREE.SpriteMaterial({ map: pointer, color: 0xffffff, side: THREE.DoubleSide })
    let sprite = new THREE.Sprite(pointerMaterial)
    sprite.name = name
    sprite.href = href
    sprite.position.copy(position.clone().normalize().multiplyScalar(49))
    sprite.scale.multiplyScalar(3)
    scene.add(sprite)
}

document.addEventListener('mousewheel', onMouseWheel, false);  //thay đổi zoom
function onMouseWheel(event) {
    const fov = camera.fov + event.deltaY * 0.05;
    camera.fov = THREE.MathUtils.clamp(fov, 10, 65);
    camera.updateProjectionMatrix();
}

window.addEventListener('resize', () => {
    camera.aspect = window.innerWidth / window.innerHeight
    camera.updateProjectionMatrix()
    renderer.setSize(window.innerWidth, window.innerHeight)
})

// animation
function animation(time) {
    renderer.render(scene, camera)
    orbit.update()
}
animation()
let rayCaster = new THREE.Raycaster()

function onClick(e) {
    let mouse = new THREE.Vector2(
        (e.clientX / window.innerWidth) * 2 - 1,
        -(e.clientY / window.innerHeight) * 2 + 1
    )
    rayCaster.setFromCamera(mouse, camera)
    let intersects = rayCaster.intersectObjects(scene.children)
    // console.log(intersects)
    // let intersects = rayCaster.intersectObject(sphere)
    if (intersects.length > 0) {
        console.log(intersects[0].point)
        // addPointer(intersects[0].point)
    }

    intersects.forEach(function (intersects) {
        if (intersects.object.type === 'Sprite') {
            window.location.href = intersects.object.href
        }
    })
}

function onMousemove(e) {
    let mouse = new THREE.Vector2(
        (e.clientX / window.innerWidth) * 2 - 1,
        -(e.clientY / window.innerHeight) * 2 + 1
    )
    rayCaster.setFromCamera(mouse, camera)
    let foundSprite = false
    let intersects = rayCaster.intersectObjects(scene.children)
    intersects.forEach(function (intersects) {
        if (intersects.object.type === 'Sprite') {
            let p = intersects.object.position.clone().project(camera)
            point.style.top = ((-1 * p.y + 1) * window.innerHeight / 2) + 'px'
            point.style.left = ((p.x + 1) * window.innerWidth / 2) + 'px'
            point.classList.add('is-active')
            point.innerHTML = intersects.object.name +
                "<p> -Đây là một trong những thành phần của " + intersects.object.name + "</p>" +
                "<p> -Loại vật thể : " + intersects.object.type + " !</p>"
            pointActive = true
            foundSprite = true
        }
    })
    if (foundSprite === false && pointActive) {
        point.classList.remove('is-active')
    }
}
addPointer(new THREE.Vector3(
    48.59228787516836,
    -2.1959737298081343,
    10.858150146455786
),
    'studio', '/point5')
addPointer(new THREE.Vector3(
    -13.911881003120863,
    -15.969201907525708,
    -44.997712450544284
),
    'bãi đất trống', '/point2')
container.addEventListener('click', onClick)
container.addEventListener('mousemove', onMousemove)




