window.onload = () => console.log('winonload') // для сравнения
isReady(myCallback)


function isReady (callbackFunction) {
    document.addEventListener('readystatechange', () => { //событие вызывается при изменении состояния загрузки документа
        if (document.readyState === 'complete') { // проверяем свойство document.readyState которое отображает текущее состояние загрузки
            callbackFunction()                      // вызываем переданную функцию когда readyState будет complete
        }
    })
}

function myCallback() {                         //колбэк функция для примера
    console.log('document loading is complete')
}

