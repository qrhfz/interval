package dev.qori.interval

class Observable<T> {
    private val subscribers = mutableListOf<(T)->Unit>()

    fun addSubscriber(subscriber:(T)->Unit){
        subscribers.add(subscriber)
    }

    fun removeSubscriber(subscriber:(T)->Unit){
        subscribers.remove(subscriber)
    }

    fun notifySubscribers(data:T){
        subscribers.forEach { sub->
            sub(data)
        }
    }
}