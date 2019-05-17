import React from 'react';
import Header from '../Header';
import '../../assets/styles/App.scss';
import Credentials from "../Credentials"
import {Profiles} from "./Profiles"


const Events = (props) => {
    return (
            <div>
                <Header page={props.page}/>
                <Credentials onlyLocal={false}/>
                {/*<div>Context/User info</div>*/}
                <Profiles/>
            </div>
    );
};

export default Events;
