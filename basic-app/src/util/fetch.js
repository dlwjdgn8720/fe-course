/**
 *  fetch 함수 호출
 */

export const fetchData = async (url) => {
    const response = await fetch(url);
    return await response.json();
}